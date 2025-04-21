# Build Flags
These do things. Lmao!

## Misc
- `DISABLE_PLUGINS`: Disables plugins (mind blown)
- `DISCORDRPC`: Enables Discord RPC if your not on windows, only works for C++ target platforms otherwise you just get a compiler error
- `DISABLE_SCREENSHOT`: Disables screenshots (mind blown)
- `SCRIPT_FILES`: Enables the `getScriptFile` function for `FileManager.hx`
- `DISABLE_LOCALIZED_ASSETS`: Disables asset localization attempts for `FileManager.hx`
- `DEFAULT_DIRECTORY`: Disables custom build directories besides the original ones
- `EXCESS_TRACES`: Adds in traces that are unimportant
- `PLAYTESTER_BUILD`: Adds in a "-playtest" to the end of the version string

## QOL Flags
- `DISABLE_ANNOYING_ERRORS`: Makes errors less annoying
- `DISABLE_ANNOYING_WARNINGS`: Makes warnings less annoying
- `RECOMPILE_ON_MOD_UPDATE` (enabled by default): Makes it so that when doing `-watch` and changing mod files the game recompiles
- `DO_NOT_RECOMPILE_ON_MOD_UPDATE`: Disables `RECOMPILE_ON_MOD_UPDATE`
- `NO_MODS`: When compiling with debug you don't get the debug_mods folder being transformed into the mods folder
- `RECOMPILE_ON_ASSET_UPDATE` (enabled by default): Makes it so that when doing `-watch` and changing asset script files the game recompiles
- `DO_NOT_RECOMPILE_ON_ASSET_UPDATE`: Disables `RECOMPILE_ON_ASSET_UPDATE`

## Start State Flags
TBA

## Language Flags
- `CNGLA_TRACES`: Allows the console to print out what localized assets it could not get