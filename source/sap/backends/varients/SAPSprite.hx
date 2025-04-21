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

                var imageType:String = null;
                if (data.imageType != null) imageType = data.imageType; else imageType = 'pixel-spritesheet';

		switch (imageType.toLowerCase())
		{
			default:
                                final animated:Null<Bool> = data.imageAnimated ? true : false;
                                final dimensions:Array<Int> = (data.imageDimensions == null) ? [16,16] : data.imageDimensions; 

				loadGraphic(FileManager.getImageFile(data.imagePath), animated, dimensions[0], dimensions[1]);
		}

		Global.scaleSprite(this);
	}
}
