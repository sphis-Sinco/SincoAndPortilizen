package sap.menus;

class MainMenu extends State
{
	override public function new()
	{
		super('MainMenu');
	}

	override function create()
	{
		super.create();

                var bg:SAPSprite = new SAPSprite({
                        position: [0,0],
                        spriteType: 'image',
                        imagePath: 'mainmenu/MainMenuGrid'
                });
                bg.screenCenter();
                add(bg);

		var centerBox:SAPSprite = new SAPSprite({
			position: [0, 0],
                        spriteType: 'graphic',
                        graphicDimensions: [64,64],
                        graphicColor: FlxColor.BLACK
		});
                centerBox.screenCenter();
		add(centerBox);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
