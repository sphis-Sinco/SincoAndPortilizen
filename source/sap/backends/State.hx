package sap.backends;

class State extends FlxState
{
	public var StateIdentifier:String = 'Unknown';

	override public function new(id:String)
	{
		super();

		StateIdentifier = id;
	}
}
