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
			localeName = Reflect.getProperty(languageJson, 'internalname');

			if (localeName == null)
			{
				Log.warn('The "$language" locale does not have the "internalname" field.');

				localeName = language;
			}

			final localeAssetSuffix:String = Reflect.getProperty(languageJson, 'asset-path');

			if (localeAssetSuffix == null)
				FileManager.LOCALIZED_ASSET_SUFFIX = '';
			else
				FileManager.LOCALIZED_ASSET_SUFFIX = localeAssetSuffix;

                        #if EXCESS_TRACES
                        Log.haxeTrace(Reflect.fields(languageJson));
                        #end
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
