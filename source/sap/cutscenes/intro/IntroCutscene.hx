package sap.cutscenes.intro;

class IntroCutscene extends PanelCutscene
{
	override public function new():Void
	{
		super('intro');

		soundFX = new FlxSound();
	}

	override function finishedCutscene(?cutscene_skipped:Bool)
	{
		super.finishedCutscene(cutscene_skipped);

		Global.switchState(new Worldmap());
	}

	public var soundFX:FlxSound;

	override function panelEvents(panel:Int):Void
	{
		super.panelEvents(panel);

		switch (panel)
		{
			case 2:
				soundFX.loadEmbedded(FileManager.getSoundFile('sounds/intro/tirok', CUTSCENES));
			default:
				soundFX.loadEmbedded(FileManager.getSoundFile('sounds/intro/line-${panel}', CUTSCENES));
		}

		soundFX.play();
	}
}
