package sap.global;

class Locale
{
	public function new(starting_locale:String)
	{
		initalizeLocale(starting_locale);
	}

	public var languageJson:Dynamic = {};
	public var localeName:String = '';

	public function initalizeLocale(language:String):Void
	{
		final localeSave:Dynamic = languageJson;

		languageJson = FileManager.getJSON(FileManager.getDataFile('locale/$language.json'));

		if (languageJson == null)
		{
			Log.error('Could not get the "$language" locale JSON (perhaps a mispelling?)');
			languageJson = localeSave;
		}
		else
		{
                        localeName = Reflect.getProperty(languageJson, 'internal-name');

			if (localeName == null)
			{
				Log.warn('The "$language" locale does not have the "internal-name" field.');

				localeName = language;
			}
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
