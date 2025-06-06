package sap.savedata;

class Results
{
	public static function returnDefaultResults():Dynamic
	{
		return {
			grade: "F",
			rank: "awful"
		};
	}

	/**
	 * This makes sure there are no null values
	 */
	public static function setupResults():Void
	{
		// just the base thing
		FlxG.save.data.results ??= returnDefaultResults();

		// actual values
		FlxG.save.data.results.grade ??= "F";
		FlxG.save.data.results.rank ??= "awful";
	}
}
