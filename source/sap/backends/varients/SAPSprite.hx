package sap.backends.varients;

typedef SAPSpriteData =
{
	var position:Array<Float>;

	var imagePath:String;
	var ?imageType:String;

	// Aesprite spritesheets
	var ?imageAnimated:Bool;
	var ?imageDimensions:Array<Int>;
}

class SAPSprite extends FlxSprite
{
	override public function new(data:SAPSpriteData)
	{
		super(data.position[0], data.position[1]);

		switch (data.imageType.toLowerCase())
		{
			default:
				loadGraphic(FileManager.getImageFile(data.imagePath), data.imageAnimated, data.imageDimensions[0], data.imageDimensions[1]);
		}
	}
}
