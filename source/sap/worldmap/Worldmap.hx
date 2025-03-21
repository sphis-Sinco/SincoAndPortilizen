package sap.worldmap;

import sap.mainmenu.MainMenu;
import sap.stages.stage1.Stage1;
import sap.stages.stage4.Stage4;

class Worldmap extends State
{
	public static var character:MapCharacter;
	public static var charWheel:CharacterWheel;

	public static var current_level:Int = 1;

	public static var mapGRP:FlxTypedGroup<FlxSprite>;

	public static var implementedLevels(get, never):Map<String, Array<Bool>>;

	static function get_implementedLevels():Map<String, Array<Bool>>
	{
		return ["sinco" => [true, false, false, false], "port" => [true, false, false, false]];
	}

	override public function new(char:String = "Sinco")
	{
		super();

		charWheel = new CharacterWheel();
		character = new MapCharacter(char);
		mapGRP = new FlxTypedGroup<FlxSprite>();
	}

	override function create()
	{
		super.create();

		var bg = new FlxSprite();
		bg.makeGraphic(FlxG.width, FlxG.height);
		add(bg);

		character.screenCenter();
		character.x = 32 + character.width;
		mapTileXPosThing = character.getGraphicMidpoint().x;

		makeMap();

		add(mapGRP);
		add(character);

		charWheel.screenCenter(X);
		charWheel.y = charWheel.height + 16;

		charWheel.animation.play('${character.lowercase_char()}');

		add(charWheel);

		Global.changeDiscordRPCPresence('In the worldmap as ${character.char}', null);
	}

	public static var mapTileXPosThing:Float = 0;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustReleased([LEFT, RIGHT]) && character.animationname() != 'run')
		{
			characterMove();
		}

		if (FlxG.keys.justReleased.ENTER && character.animationname() == 'idle')
		{
			playLevel();
		}

		if (FlxG.keys.justReleased.SPACE && canSwap)
		{
			swap();
		}
	}

	public dynamic function characterMove()
	{
		canSwap = false;
		character.flipX = FlxG.keys.justReleased.LEFT;

		current_level += (character.flipX) ? -1 : 1;
		if (current_level > 3)
		{
			current_level -= 1;
			canSwap = true;
			return;
		}

		character.animation.play('run');
		FlxTween.tween(character, {x: character.x + ((character.flipX) ? -256 : 256)}, 1, {
			onComplete: characterMoveDone()
		});
	}

	public dynamic function characterMoveDone():TweenCallback
	{
		return tween ->
		{
			canSwap = true;
			character.animation.play('idle');

			if (current_level < 1)
			{
				FlxG.switchState(() -> new MainMenu());
				current_level += 1;
			}
		}
	}

	public dynamic function playLevel()
	{
		switch (current_level)
		{
			// TODO: implement level unlocking PLEASE
			case 1:
				level1();
		}
	}

	public dynamic function level1()
	{
		FlxG.switchState(() -> ((character.lowercase_char() == 'sinco') ? new Stage1() : new Stage4()));
	}

	public dynamic function swap()
	{
		canSwap = false;
		charWheel.animation.play('${character.lowercase_char()}-${character.swappedchar().toLowerCase()}');

		FlxTimer.wait(2 / 12, () ->
		{
			swapWaitDone();
		});
	}

	public dynamic function swapWaitDone()
	{
		Global.changeDiscordRPCPresence('In the worldmap as ${character.swappedchar()}', null);

		FlxG.camera.flash(0xffffff, 1, () ->
		{
			canSwap = true;
		});
		for (tile in mapGRP)
		{
			tile.destroy();
			mapGRP.remove(tile);
		}
		makeMap();
		character.swapCharacter();
		character.animation.play('idle');
	}

	public static var canSwap:Bool = true;

	public dynamic function makeMap()
	{
		var i = 0;
		while (i < 3)
		{
			makeNewTile(i);

			i++;
		}
	}

	public dynamic function makeNewTile(i:Int)
	{
		// TODO: change these to use MapTile once you figure out the bug

		var level:FlxSprite = new FlxSprite(mapTileXPosThing - 12 + (i * 256), character.getGraphicMidpoint().y);
		var tileColor:FlxColor = FlxColor.BLACK;

		if (implementedLevels.get(character.lowercase_char())[i] != false)
		{
			tileColor = FlxColor.RED;

			// TODO: implement color change for when a level is finished
		}

		level.makeGraphic(24, 24, tileColor);

		mapGRP.add(level);
	}
}
