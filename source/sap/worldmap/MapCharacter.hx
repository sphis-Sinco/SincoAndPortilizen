package sap.worldmap;

class MapCharacter extends FlxSprite
{
	// This is so I don't have to do this:
	// char = (char == "Sinco") ? "Port" : "Sinco"
	public var characterList:Map<String, String> = ["Sinco" => "Port", "Port" => "Sinco"];

	override public function new(curchar:String = 'Sinco'):Void
	{
		super();

		char = characterList.get(curchar);
		swapCharacter();
		animation.play('idle');
	}

	public var char:String = 'Sinco';

	public function swapCharacter():Void
	{
		char = characterList.get(char);

		loadGraphic(FileManager.getImageFile('worldmap/${char}WorldMap'), true, 16, 16);
		animation.add('idle', [0]);
		animation.add('jump', [1]);
		animation.add('wait', [2]);
		animation.add('run', [3, 4], 12);
		Global.scaleSprite(this);
	}

	public function lowercase_char():String
	{
		return char.toLowerCase();
	}

	public function animationname():String
	{
		return animation.name;
	}

	public function swappedchar():String
	{
		return characterList.get(char);
	}
}
