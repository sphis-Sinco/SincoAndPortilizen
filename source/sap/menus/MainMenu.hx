package sap.menus;

class MainMenu extends State
{
	public static var MENU_OPTIONS:Array<String> = ['play', 'credits', 'settings', #if debug 'traces', #end 'exit'];

	static var MENU_TEXTS:FlxTypedGroup<FlxText>;
	static var CENTER_BOX:SAPSprite;

	override public function new()
	{
		super('MainMenu');

		MENU_TEXTS = new FlxTypedGroup<FlxText>();
	}

	override function create()
	{
		super.create();

		var bg:SAPSprite = new SAPSprite({
			position: [0, 0],
			spriteType: 'image',
			imagePath: 'mainmenu/MainMenuGrid'
		});
		bg.screenCenter();
		add(bg);

		CENTER_BOX = new SAPSprite({
			position: [0, 0],
			spriteType: 'graphic',
			graphicDimensions: [64, Std.int(64 + ((MENU_OPTIONS.length - 4) * 32))],
			graphicColor: FlxColor.BLACK,
			graphicDISMScale: true
		});
		CENTER_BOX.screenCenter();
		add(CENTER_BOX);

		add(MENU_TEXTS);

		reload_menu_texts();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	public static function reload_menu_texts():Void
	{
		var index:Int = 0;
		for (text in MENU_OPTIONS)
		{
                        final text_size:Int = 32;

			var new_text:FlxText = new FlxText(0, CENTER_BOX.y, CENTER_BOX.width * Global.DEFAULT_IMAGE_SCALE_MULTIPLIER, text.toLowerCase(), text_size);
			new_text.alignment = CENTER;

			new_text.screenCenter(X);
			new_text.y = (CENTER_BOX.y - CENTER_BOX.height) + ((text_size * 2) * index);

			MENU_TEXTS.add(new_text);
			index++;
		}
	}
}
