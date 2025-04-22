package sap.global;

class Locale
{
	public var languageJson:Dynamic = {};
	public var localeName:String = '';

	public function initalizeLocale(language:String):Void
	{
		final localeSave:Dynamic = languageJson;

		languageJson = FileManager.getJSON(FileManager.getDataFile('local/$language.json'));

		if (languageJson == null)
		{
			Log.error('Could not get the "$language" locale JSON (perhaps a mispelling?)');
			languageJson = localeSave;
		}
		else
		{
			if (!Reflect.hasField(languageJson, 'internal-name'))
			{
				Log.warn('The "" locale does not have the "internal-name" field.');

				localeName = language;
			}
			else
				localeName = Reflect.getProperty(languageJson, 'internal-name');
		}
	}

	public function getPhrase(field:String, fallback:String):String
	{
		if (Reflect.hasField(languageJson, field))
			return Reflect.getProperty(languageJson, field);
		else
		{
			Log.warn('The current locale does not have the "$field" field.');

			var returnFallback = fallback;

			return returnFallback ??= '';
		}
	}
}
