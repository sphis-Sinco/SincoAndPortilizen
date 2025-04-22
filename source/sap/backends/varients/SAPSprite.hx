package sap.backends.varients;

typedef SAPSpriteData =
{
	var position:Array<Float>;

	var spriteType:String;

	// Graphics
	var ?graphicDimensions:Array<Int>;
	var ?graphicColor:FlxColor;

	// Images
	var ?imageType:String;

	var ?imagePath:String;
	var ?scaleAddition:Int;

	// Aesprite spritesheets
	var ?imageAnimated:Bool;
	var ?imageDimensions:Array<Int>;
	var ?imageAnimations:Array<Array<Dynamic>>;
}

class SAPSprite extends FlxSprite
{
	override public function new(data:SAPSpriteData)
	{
		super(data.position[0], data.position[1]);

		var spr:String = data.spriteType.toLowerCase();
		var thedata:SAPSpriteData = data;

		if (spr == null)
			spr = 'graphic';

		switch (spr)
		{
			case 'graphic':
				thedata.graphicDimensions ??= [32, 32];
				thedata.graphicColor ??= FlxColor.WHITE;

				generateGraphicSprite(thedata);
			case 'image':
				thedata.imagePath ??= 'blankBG';
				thedata.imageType ??= 'pixel-spritesheet';

				generateImageSprite(thedata);
				Global.scaleSprite(this, thedata.scaleAddition ??= 0);
		}
	}

	public function generateGraphicSprite(data:SAPSpriteData):Void
	{
		makeGraphic(data.graphicDimensions[0], data.graphicDimensions[1], data.graphicColor);
	}

	public function generateImageSprite(data:SAPSpriteData):Void
	{
		var imageType:String = null;
		if (data.imageType != null)
			imageType = data.imageType;

		switch (imageType.toLowerCase())
		{
			default:
				final animated:Null<Bool> = data.imageAnimated ? true : false;
				final dimensions:Array<Int> = (data.imageDimensions == null) ? [16, 16] : data.imageDimensions;

				loadGraphic(FileManager.getImageFile(data.imagePath), animated, dimensions[0], dimensions[1]);

				if (animated)
				{
					for (animArray in data.imageAnimations)
					{
						final frameRate:Int = (animArray[2] != null) ? animArray[2] : 30;
						final loop:Bool = (animArray[3] != null) ? animArray[3] : true;

						animation.add(animArray[0], animArray[1], frameRate, loop);
					}
				}
		}
	}
}
