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

	override public function new()
	{
		super('TitleState');
	}

	override function create()
	{
		super.create();

		BACKGROUND = new SAPSprite({
			position: [0, 0],
			imagePath: 'titlescreen/TitleBG',
			scaleAddition: 1
		});
		add(BACKGROUND);
		BACKGROUND.screenCenter();
		BACKGROUND.visible = false;

		CHARACTER_RING = new SAPSprite({
			position: [0, 0],
			imagePath: 'titlescreen/CharacterRing'
		});
		CHARACTER_RING.screenCenter(X);
		CHARACTER_RING.y = -(CHARACTER_RING.height * 2);

		CHARACTER_RING_CHARACTERS = new SAPSprite({
			position: [0, 0],
			imagePath: 'titlescreen/CharacterRing-characters'
		});
		CHARACTER_RING_CHARACTERS.setPosition(CHARACTER_RING.x, CHARACTER_RING.y);

		add(CHARACTER_RING_CHARACTERS);
		add(CHARACTER_RING);

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

	private static function introSequence():Void
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

	private static function flashSequence():Void
	{
		RetroCameraFade.fadeFromWhite(FlxG.camera, 12, 1);

		BACKGROUND.visible = true;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		CHARACTER_RING_CHARACTERS.setPosition(CHARACTER_RING.x, CHARACTER_RING.y);

		if (!PLAY_MUSIC)
			PLAY_MUSIC = (SEQUENCE != DEBUG && SEQUENCE != INTRO);
		else
			Global.playMenuMusic();
	}
}
