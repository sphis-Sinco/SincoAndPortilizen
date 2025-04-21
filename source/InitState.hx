package;

import flixel.system.debug.log.LogStyle;

// This is initalization stuff + compiler condition flags
class InitState extends FlxState
{
	override public function create():Void
	{
		Timer.measure(function()
		{
			trace('init');
			ModsInit();
			LanguageInit();

			// Set the saveslot to a debug saveslot or a release saveslot
			Global.change_saveslot((Global.DEBUG_BUILD) ? 'debug' : 'release');

			if (FlxG.save.data.settings != null)
			{
				FlxG.sound.volume = FlxG.save.data.settings.volume;

				#if DISCORDRPC
				if (FlxG.save.data.settings.discord_rpc)
					Discord.DiscordClient.initialize();
				else
					Discord.DiscordClient.shutdown();
				#end
			}

			#if web
			// pixel perfect render fix!
			lime.app.Application.current.window.element.style.setProperty("image-rendering", "pixelated");
			#end

			// Make errors and warnings less annoying.
			#if DISABLE_ANNOYING_ERRORS
			LogStyle.ERROR.openConsole = false;
			LogStyle.ERROR.errorSound = null;
			#end

			#if DISABLE_ANNOYING_WARNINGS
			LogStyle.WARNING.openConsole = false;
			LogStyle.WARNING.errorSound = null;
			#end

			FlxG.sound.volumeUpKeys = [];
			FlxG.sound.volumeDownKeys = [];
			FlxG.sound.muteKeys = [];
			#if EXCESS_TRACES
			#if DISABLE_ANNOYING_ERRORS
			trace('Disabled annoying errors');
			#end
			#if DISABLE_ANNOYING_WARNINGS
			trace('Disabled annoying warnings');
			#end
			trace('Disabled volume keys');
			#end
		});

		if (!Global.DEBUG_BUILD)
		{
			#if EXCESS_TRACES
			trace('Game is not a debug build, auto-proceed');
			#end
			proceed();
		}
		else
		{
			#if EXCESS_TRACES
			if (Global.DEBUG_BUILD)
			{
				trace('Game is a debug build');
			}
			#end
		}

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		// when on debug builds you have to press something to stop
		if (Global.keyJustReleased(ANY) && Global.DEBUG_BUILD)
			proceed();

		super.update(elapsed);
	}

	public static function proceed():Void
	{
		trace('Starting game regularly');
		Global.switchState(new sap.menus.TitleState());
	}

	public static function switchToState(state:FlxState, stateName:String):Void
	{
		trace('Moving to $stateName');
		Global.switchState(state);
	}

	public static function ModsInit():Void
	{
		Timer.measure(function()
		{
			TryCatch.tryCatch(function()
			{
				trace('mods init');
			});
		});
	}

	public static function LanguageInit():Void
	{
		Timer.measure(function()
		{
			trace('language init');
		});
	}
}
