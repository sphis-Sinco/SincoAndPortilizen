package playframe.script;

class HScript extends HaxeScript
{
	public var hscript:Interp;

	public function new()
	{
		hscript = new Interp();
		super();
	}

	public override function executeFunc(funcName:String, ?args:Array<Any>):Dynamic
	{
		if (hscript == null)
		{
			this.trace("HScript is null");
			return null;
		}
		if (hscript.variables.exists(funcName))
		{
			var f = hscript.variables.get(funcName);
			if (args == null)
			{
				var result = null;
				try
				{
					result = f();
				}
				catch (e)
				{
					this.trace('$e');
				}
				return result;
			}
			else
			{
				var result = null;
				try
				{
					result = Reflect.callMethod(null, f, args);
				}
				catch (e)
				{
					this.trace('$e');
				}
				return result;
			}
			// f();
		}
		return null;
	}

	public override function loadFile(path:String)
	{
		if (path.trim() == "")
			return;
		fileName = Path.withoutDirectory(path);
		var paath = path;
		//trace(paath);
		if (Path.extension(paath) == "")
		{
			var haxeExts = ["hx", "hsc", "hscript"];
			for (ext in haxeExts)
			{
				if (FileSystem.exists('$paath.$ext'))
				{
					paath = '$paath.$ext';
					fileName += '.$ext';
					break;
				}
			}
		}
		try
		{
			hscript.execute(ScriptSupport.getExprFromPath(paath, false));
		}
		catch (e)
		{
			this.trace('${e.message}');
		}
	}

	public override function trace(text:String)
	{
		var posInfo = hscript.posInfos();

		// var fileName = posInfo.fileName;
		var lineNumber = Std.string(posInfo.lineNumber);
		var methodName = posInfo.methodName;
		var className = posInfo.className;
                /*:$methodName:$lineNumber*/
		trace('$fileName: $text');

		return;
	}

	public override function setVariable(name:String, val:Dynamic)
	{
		hscript.variables.set(name, val);
	}

	public override function getVariable(name:String):Dynamic
	{
		return hscript.variables.get(name);
	}

	public override function destroy():Void{
		super.destroy();

		hscript.variables = null;
		hscript = null;
	}
}