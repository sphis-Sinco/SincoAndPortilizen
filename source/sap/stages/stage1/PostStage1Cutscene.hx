package sap.stages.stage1;

import sap.cutscenes.PanelCutscene;
import sap.worldmap.Worldmap;

class PostStage1Cutscene extends PanelCutscene
{
	override public function new()
	{
		super({
			max_panels: 4,
			panel_prefix: 'ps1-',
			panel_folder: 'post-stage1/',
			rpc_details: "In the post-stage 1 cutscene"
		});
	}

	override function finishedCutscene()
	{
		super.finishedCutscene();

		FlxG.switchState(() -> new Worldmap());
	}

	override function panelEvents(panel:Int)
	{
		super.panelEvents(panel);

		switch (panel)
		{
			// gonna put voiceover stuff here prob
			case 2:
				Global.pass();
		}
	}
}
