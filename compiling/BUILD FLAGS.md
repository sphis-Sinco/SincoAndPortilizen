# Build Flags
These do things. Lmao!

## Misc
- `DISABLE_PLUGINS`: Disables plugins (mind blown)
- `DISCORDRPC`: Enables Discord RPC if your not on windows, only works for C++ target platforms otherwise you just get a compiler error
- `DISABLE_SCREENSHOT`: Disables screenshots (mind blown)
- `SCRIPT_FILES`: Enables the `getScriptFile` function for `FileManager.hx`
- `DISABLE_LOCALIZED_ASSETS`: Disables asset localization attempts for `FileManager.hx`
- `DEFAULT_DIRECTORY`: Disables custom build directories besides the original ones

## QOL Flags
- `DISABLE_ANNOYING_ERRORS`: Makes errors less annoying
- `DISABLE_ANNOYING_WARNINGS`: Makes warnings less annoying

## Start State Flags
- `SKIP_TITLE`: Sends you to the Main Menu instantly instead of the Title Screen
- `STAGE_ONE`: Sends you to the first stage
- `STAGE_FOUR`: Sends you to the fourth stage
- `WORLDMAP`: Sends you to the worldmap as Sinco
- `RESULTS`: Sends you to the results state as Sinco
- `BAD_RANK` (executes with `RESULTS`): Sets the rank you will get to the bad rank
- `GOOD_RANK` (executes with `RESULTS`): Sets the rank you will get to the good rank
- `GREAT_RANK` (executes with `RESULTS`): Sets the rank you will get to the great rank
- `EXCELLENT_RANK` (executes with `RESULTS`): Sets the rank you will get to the excellent rank
- `PERFECT_RANK` (executes with `RESULTS`): Sets the rank you will get to the perfect rank
- `PORT_RANK_CHAR` (executes with `RESULTS`): Sends you to the results state as Portilizen

## Language Flags
- `CNGLA_TRACES`: Allows the console to print out what localized assets it could not get
- `FORCED_ENGLISH_LANGUAGE`: Forces your language to English
- `SPANISH_LANGUAGE`: Sets your language to (Google-translated) Spanish
- `PORTUGUESE_LANGUAGE`: Sets your language to Portuguese

## Modding Flags
- `MASS_MOD`: Enables the mass mod