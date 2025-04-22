package sap.menus;

import funkin.effects.RetroCameraFade;

enum abstract TitleSequences(String) from String to String
{
	var DEBUG = 'debug';
	var INTRO = 'intro';
	var FLASH = 'flash';
	var COMPLETE = 'complete';
}

class TitleState extends State
{
	public static var SEQUENCE:TitleSequences = (Global.DEBUG_BUILD) ? DEBUG : INTRO;

	public static var PLAY_MUSIC:Bool = false;

	public static var BACKGROUND:SAPSprite;

	public static var CHARACTER_RING:SAPSprite;
	public static var CHARACTER_RING_CHARACTERS:SAPSprite;

	public static var SINCO:SAPSprite;
	public static var PORTILIZEN:SAPSprite;

	public static var PRESS_ANY:SAPSprite;

	public static var VERSION_TEXT:FlxText;

	override public function new()
	{
		super('TitleState');
	}

	override function create()
	{
		super.create();

		BACKGROUND = new SAPSprite({
			position: [0, 0],
			spriteType: 'image',
			imagePath: 'titlescreen/TitleBG',
			scaleAddition: 1
		});
		add(BACKGROUND);
		BACKGROUND.screenCenter();
		BACKGROUND.visible = false;

		CHARACTER_RING = new SAPSprite({
			position: [0, 0],
			spriteType: 'image',
			imagePath: 'titlescreen/CharacterRing'
		});
		CHARACTER_RING.screenCenter(X);
		CHARACTER_RING.y = -(CHARACTER_RING.height * 2);

		CHARACTER_RING_CHARACTERS = new SAPSprite({
			position: [0, 0],
			spriteType: 'image',
			imagePath: 'titlescreen/CharacterRing-characters'
		});
		CHARACTER_RING_CHARACTERS.setPosition(CHARACTER_RING.x, CHARACTER_RING.y);

		add(CHARACTER_RING_CHARACTERS);
		add(CHARACTER_RING);

		SINCO = new SAPSprite({
			position: [0, 0],
			spriteType: 'image',
			imagePath: 'titlescreen/TitleSinco',
			imageAnimated: true,
			imageDimensions: [8, 8],
			imageAnimations: [['walk', [0, 1, 2, 3], 12]]
		});
		PORTILIZEN = new SAPSprite({
			position: [0, 0],
			spriteType: 'image',
			imagePath: 'titlescreen/TitlePort',
			imageAnimated: true,
			imageDimensions: [8, 8],
			imageAnimations: [['walk', [0, 1, 2, 3, 4], 12]]
		});

		SINCO.visible = PORTILIZEN.visible = false;

		add(SINCO);
		add(PORTILIZEN);

		SINCO.animation.play('walk');
		PORTILIZEN.animation.play('walk');

		PRESS_ANY = new SAPSprite({
			position: [0, FlxG.height - (16 * Global.DEFAULT_IMAGE_SCALE_MULTIPLIER)],
			spriteType: 'image',
			imagePath: 'titlescreen/PressAnyToPlay'
		});
		PRESS_ANY.screenCenter(X);
		add(PRESS_ANY);
		PRESS_ANY.visible = false;

		VERSION_TEXT = new FlxText(10, 10, 0, Global.GAME_WATERMARK, 12);
		VERSION_TEXT.color = 0x000000;
		add(VERSION_TEXT);
		VERSION_TEXT.visible = false;

		if (SEQUENCE == INTRO || SEQUENCE == DEBUG)
		{
			if (SEQUENCE == INTRO)
				introSequence();
			else
				FlxTimer.wait(1, function()
				{
					introSequence();
					SEQUENCE = INTRO;
				});
		}
		else
			flashSequence(); // By doing this it makes sure that everything is initalized.
	}

	function introSequence():Void
	{
		RetroCameraFade.fadeBlack(FlxG.camera, 12, 1);

		Global.playSoundEffect('start-synth');

		FlxTween.tween(CHARACTER_RING, {
			y: CHARACTER_RING.height + 16
		}, 1.0, {
			ease: FlxEase.sineOut,
			startDelay: .4,
			onComplete: function(tween)
			{
				SEQUENCE = FLASH;
				flashSequence();
			}
		});
	}

	function flashSequence():Void
	{
		RetroCameraFade.fadeFromWhite(FlxG.camera, 12, 1);
		new FlxTimer().start(1.1, function(tween)
		{
			if (FlxG.camera.filters != null)
				FlxG.camera.filters = null;
		}, 12);
                
		// :)
		VERSION_TEXT.visible = PRESS_ANY.visible = BACKGROUND.visible = true;

		SEQUENCE = COMPLETE;
	}

	function completeSequence():Void
	{
		randomBGChar(SINCO, 6);
		randomBGChar(PORTILIZEN, 4);

		if (Global.keyJustReleased(ENTER))
			Global.switchState(new MainMenu());
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		CHARACTER_RING_CHARACTERS.setPosition(CHARACTER_RING.x, CHARACTER_RING.y);

		if (!PLAY_MUSIC)
			PLAY_MUSIC = (SEQUENCE != DEBUG && SEQUENCE != INTRO);
		else
			Global.playMenuMusic();

		if (SEQUENCE == COMPLETE)
			completeSequence();
	}

	/**
	 * Takes a FlxSprite and moves it from the left side of the screen to the right with a random chance of it happening.
	 * @param char FlxSprite you would like to move
	 * @param chance The chances in which your FlxSprite will spawn and start moving
	 */
	public static function randomBGChar(char:FlxSprite, chance:Float):Void
	{
		if (FlxG.random.bool(chance) && !char.visible)
		{
			char.visible = true;
			char.y = FlxG.height - (32 * Global.DEFAULT_IMAGE_SCALE_MULTIPLIER);
			char.x = -(char.width * 2);
			FlxTween.tween(char, {x: FlxG.width + (char.width * 2)}, 2, {
				onComplete: function(tween)
				{
					FlxTimer.wait(FlxG.random.float(1, 4), () ->
					{
						char.visible = false;
					});
				}
			});
		}
	}
}
