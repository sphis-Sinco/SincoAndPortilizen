# Alpha
## 0.2.1a - 3/12/2025
### Nerd stuff
- Reverted most shit to 0.1.1a
### Removed
- Removed HScript modding
### Fixed
- Fixed hitHurt sounds trying to play a hitHurt-0 sound that doesn't exist.

## 0.2.0a - 3/12/2025
### Changed
- Changed it so that now [Stage 1 and Stage 4 are now a mix of soft-coded and hard-coded.](#18_link)
### Fixed
- Fixed internal bug where it would say "`Failed to change to language: english`" but `LANGUAGE` is supposed to be another language
### Added
- Added custom Stage 1 background created by @iampauleps
- Added mod support (`scripts/`) for:
        - MainMenu (`menus/MainMenu`)
        - WorldMap (`gameplay/Worldmap`)
        - TitleState (`menus/TitleState`)
        - Stage1 (`gameplay/MainMenu`)
        - Stage4 (`gameplay/MainMenu`)
        - Credits (`submenus/Credits`)
        - Settings (`submenus/Settings`)
        - Results (`gamplay/Results`)
- Added [tutorial elements to stage 1 and 4](#14_link)

## 0.1.1a - 2/22/2025
### Fixed
- Fixed crash on web when trying to take a screenshot ([#16][#16_link])
- Fixed when returning to the world map from a portilizen level the character wheel is on the sinco selection ([#11][#11_link])
- Fixed no sound in stage 4 ([#12][#12_link])
- Fixed volume being at 100% on desktop is 99.99...% on web ([#10][#10_link])

## 0.1.0a - 2/22/2025
### Added
- Added Results menu on death for stage 1
### Fixed
- Fixed HTML5 crashing when beating a level
- Fixed bug where in stage 1 the Results menu wouldn't adapt to the players max health.
- Fixed bug where in stage 1 and 4 the opponent wont attack once replaying the level ([#8][#8_link])
- Fixed bug where in stage 4 there is no results screen ([#9][#9_link])
- Fixed bug where in stage 4 the timer stays the same as it last was ([#7][#7_link])
### Changed
- Changed Results menu so the music stops when you leave
- Changed Company name in `project.xml` to `SAPTeam`

# Prototype
## 0.0.8-p - 2/22/2025
### Added
- Settings menu
- Language Setting
- Volume Setting
- Window resolution Setting (neko, windows, linux and mac only)
### Removed
- Translations folder

## 0.0.7-p - 2/19/2025
This update adds a `Build.py` file that helps with compiling :)

### Changed
- Changed the following custom BUILD_DIR conditions to no longer depend on being a release build for their directory to take place unless specified by `DEFAULT_DIRECTORY`
        - MASS_MOD
        - FORCED_ENGLISH_LANGUAGE
        - SPANISH_LANGUAGE
        - PORTUGUESE_LANGUAGE
- Changed it so credits alignment is now center
- Changed Results percent text to be opaque
### Fixed
- Fixed Djotta flow credits exitting screen bounds
### Added
- Readded Translations (they are back and now they work on windows!)
        - Added Translations for Credits
- Added new Build directories

## 0.0.6-p - 2/18/2025
This update fixes crashes on 0.0.5-p with no additional content.

### Fixed
- [Fixed game crashing on launch][#6_link]
### Removed
- Translations (cause of [crash][#6_link])

## 0.0.5-p - 2/15/2025
### Removed
- Removed "Press any" alpha fade in
### Added
- Added Indicator for when Osin is going to attack (Stage 1)
- [Added Localization][#4_link]
        - Added Build flags for Localization
        - Added Spanish Translation (Google Translate)
        - Added Portuguese Translation (by Djotta Flow)
        - Added Localized Assets for images with text (for both languages)
        - Added `cur_lang.txt` file that can control the language thats set (gets overwritten by build flags)
        - Added BUILD_DIRs for the different languages
- [Added `.bat` files for compiling (some for different languages too!)][#4_link]
- [Added source code mod support through a plugin-like system][#5_link]
        - Added Mass mod (modifies every state that can be changed)
### Changed
- [Changed the Sound Tray][#3_link]
- [Changed almost every state's custom functions to be `public static dynamic` functions (Source Code Mod Support)][#5_link]

## 0.0.4-p - 2/14/2025
### Changed
- Changed system for levels beat
- Changed savedata `level` to `levels_completed`
- Changed Screenshot plugin to now be the FNF Screenshot Plugin (same keybind, its just based of funkin to fix a bug)
### Added
- Added countdown text to Stage 4
- Added HMM file
- Added Results State
- Added Several Build Flags
- Added Discord RPC
- Added [Build Flags markdown file](/compiling/BUILD%20FLAGS.md)
- [Added Credits Menu][#2_link]
### Removed
- Removed unused data files
- Removed Chaos Emeralds (Gameplay and code)
### Fixed
- Fixed bug where DISABLE_PLUGINS enables plugins
- Fixed bug where the screenshot [didnt do things](/random-bugs/screenshotplugin-before.png) it [should've been doing](/random-bugs/screenshotplugin-after.png)
- Fixed bug where you couldn't select the level you're on after you swap in the Worldmap

## 0.0.3-p - 2/13/2025
- Gameplay changes
        - Added screenshot plugin (you can take a screenshot with F2 unless in debug, you do F1)
        - Added stage 4 winning condition (you have to survive the level for a minute)
        - We are now in the prototype era officially
- Code changes:
        - Modified `Global.setEmeraldAmount()` function
        - Moved every folder that is sap specific to the new sap folder
        - Moved Debug build and Game version traces to the project xml
        - Added echo for build/test targets
        - Added ability to enable and disable annoying errors and warnings
        - Added compiler error for mobile
                - Compiling for mobile doesnt work
        - `FileManager_v8` now has been replaced with `Sinlib`'s `FileManager` (basically the same though)
        - Now using 8 tabs instead of like 2 or 4 spaces or smth?
        - In the code I have this little code style I've started implementing:
                - Don't leave unused imports in the code
                - Code shouldnt be more than 4 tabs long unless optimizing wouldn't do much.

## 0.0.2-p - 2/6/2025
- Added post-stage 1 cutscene
- Added title screen version text
- Worldmap Changes:
        - Added character wheel to worldmap
                - Added Portilizen world map character
                - Map now reloads when you swap
        - Added "Background" to the Worldmap
        - Worldmap tiles are now dark for levels that are not implemented
        - Worldmap tiles with unimplemented levels dont send you to the Mainmenu when you try and play them anymore
- Added Stage 4 (Portilizens first level)

## 0.0.1-p - 2/2/2025
CURRENT FEATURES:
- Title Screen
- Main Menu
- Intro Cutscene
- World map
- Stage 1 (Sinco)

[#2_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/pull/2
[#3_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/pull/3
[#4_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/pull/4
[#5_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/pull/5
[#6_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/issues/6
[#7_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/issues/7
[#8_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/issues/8
[#9_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/issues/9
[#10_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/issues/10
[#11_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/issues/11
[#12_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/issues/12
[#14_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/issues/14
[#16_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/issues/16
[#18_link]: https://github.com/sphis-Sinco/SincoAndPortilizen/issues/18