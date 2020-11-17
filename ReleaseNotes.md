# Unreal Tournament Release Notes

## General Information

### Official Unreal Tournament Web Sites

* [Unreal Tournament Home Page](https://www.unrealtournament.com)
* [Epic Games Home Page](https://epicgames.com)
* [Unreal Engine Technology Page](https://www.unrealengine.com)

### Independent Unreal Tournament Web Sites

* [UT99.org - Unreal Tournament Community](https://ut99.org)
* [OldUnreal](https://www.oldunreal.com)

## Unreal Tournament Version 469b Release Notes (Coming Soon!)

Version 469b is completely network compatible with all previous public releases of UT (down to 432).
The UTPG and OldUnreal teams worked hard to maintain binary compatibility with older native mods.
Most of these mods will continue to work in version 469b. However, some mods may need some trivial updates.
If you are a native mod author, and you are having trouble updating your mod for version 469b, then please reach out to us at [the OldUnreal forums](https://www.oldunreal.com/cgi-bin/yabb2/YaBB.pl?board=nativemods).
**Note:** This patch disables older versions of ACE.
Server admins should upgrade ACE to version 1.1e or later to check 469b clients.

### Stability Improvements

#### Unreal Editor
* Fixed a bug that caused ucc batchexport to crash while exporting native classes
* Fixed bugs that crashed Unreal Editor when attempting to import non-power-of-two (NPOT) textures
* Fixed a bug that caused Unreal Editor to crash when editing certain actor properties in the editactor window

#### Physics and Player Movement
* Fixed several FCollisionHash stability problems, including the infamous FCollisionHash::ActorLineCheck crash (thanks Eternity/Feralidragon!)

#### Game Client
* Fixed a bug that caused the game client to crash when resetting configuration options in the preferences window

#### Audio and 3D Rendering
* Fixed a bug that caused Galaxy to crash during mapswitches if you had UseDigitalMusic set to false
* Fixed a bug that caused the game client to crash in scenes with lots of lights in them

### Bug Fixes

#### Unreal Editor
* Fixed a bug that caused the 3D viewport camera to jump when clicking and holding down a mouse button without moving the mouse
* Fixed texture compression artifacts in textures whose width or height were not multiples of 4
* Fixed a problem that caused constant idle CPU usage when using UEd with audio enabled
* Fixed an UnrealEd bug that made it impossible to assign songs to MusicEvents
* Pressing cancel in the file saving dialog now works as expected
* The mover node count check that happens during map saving now works as expected

#### Physics and Player Movement
* Restored actor touch behavior for older (<v469) clients and servers
* Fixed a bug that caused collisions with invisible level geometry when playing at extremely high frame rates

#### Networking and Netcode
* Fixed a bug that made the server stop responding to in-game browser queries if there were players in PlayerWaiting or PlayerSpectating state on the server
* Removed the file size check from the HTTP file downloader. This size check prevented players from joining servers when the redirect server sent them a file of a different generation than the one the game server was using

#### Audio and 3D Rendering
* Fixed a bug that caused scriptedtextures (such as the ammo counters on the minigun, rocket launcher, and flak cannon) not to update properly
* Fixed a bug that caused the VSync menu option not to work for XOpenGLDrv
* Fixed a bug that made XOpenGLDrv render complex meshes incorrectly
* Fixed a bug that caused masked textures to render incorrectly in XOpenGLDrv
* Fixed XOpenGLDrv texture decompression for small textures and NPOT textures
* Fixed a bug that caused D3D9Drv to crash when attempting to render textures with empty compressed mipmaps
* Fixed a directdraw initialization bug that caused SoftDrv to crash in fullscreen mode
* Fixed an ALAudio bug that caused sounds to play from the wrong location
* Fixed a Galaxy bug that broke sound spatialization
* Fixed a bug that caused Cluster to play interface sounds (such as voice taunts) with the wrong pitch
* Fixed a bug that could cause ALAudio music playback to stop randomly
* Fixed an XOpenGLDrv bug that caused smallwave textures to be rendered as unmasked textures
* Fixed an XOpenGLDrv bug that caused part of the viewport to be invisible when going into fullscreen mode from a max-sized window
* Fixed a bug that caused D3DDrv screenshots to be blank when using windowed mode
* Fixed a bug that caused D3D10Drv and D3D11Drv to change the windowed mode resolution when going into fullscreen mode using ALT+ENTER
* Fixed a bug that caused objects behind mirrors to be visible in OpenGLDrv and XOpenGLDrv

#### UnrealScript
* Fixed a bug that made it possible to cycle through AnnouncerSpectators (which UTv469 uses to play announcersounds) using F5 or Viewclass binds
* Fixed bugs that made it impossible to load mods that imported color palettes from the original Botpack, UnrealI, or UnrealShare packages

#### Miscellaneous
* Fixed a bug that caused the game to parse commandline parameters incorrectly when the game was launched from a folder containing spaces
* Added the missing TTF fonts to the Linux patch package

### Enhancements

#### Unreal Editor
* Added a new package verification routine that can detect and fix up packages that are incompatible with previous versions of UT. This routine automatically runs while compiling/saving a package.
* Made the font size for the game/UEd log windows configurable in the ini
* Optimized bulk actor deletion
* Oversized textures in the texture browser now get clipped rather than ignored

#### Game Client
* Made the game client automatically load the default viewport manager when the configured viewport manager fails to load (e.g., when trying to load SDLDrv on Windows)
* Updated libcurl.dll to version 7.72.0_3 (this version will hopefully generate fewer false positive detections by malware scanners)
* Made the driver and preference caching system filter out duplicates. This fixes the duplicate entries some Linux and macOS players were seeing in the game menus (e.g., in the list of game types or skins)
* Restored compatibility with a couple of older mods that replace the game menu
* The top right corner of the in-game menu bar now includes additional version information
* The renderer no longer gets destroyed when switching between windowed mode and fullscreen mode
* Added new crosshair rendering options to the in-game menu

#### Audio and 3D Rendering
* Restored distance culling and sound dampening for occluded sound sources in Galaxy and Cluster
* Made Cluster reset all music channels when looping tracker music
* Increased the draw distance in D3D9Drv
* Restored compatibility with legacy audio drivers from earlier windows patches (although you may have to use the -nodep commandline switch)
* Improved XOpenGLDrv performance (particularly for people with older GPUs)
* Revamped OpenGLDrv shader code
* Enabled Ogg Vorbis support in all audio drivers and in the UnrealEd music browser
* Added more VSync control options to the in-game menu
* Added audio output selection options to the in-game menu (supported by ALAudio and Cluster)
* Increased the size of the vertex selection markers when using OpenGLDrv or D3D9Drv

#### Miscellaneous
* Added a menu option to control the Translocator's weapon switching behavior when pressing fire and alt-fire simultaneously. This option will only affect local games or games on 469b (and later) servers.

## Unreal Tournament Version 469a Release Notes

Version 469a is completely network compatible with all previous public releases of UT (down to 432).
The UTPG and OldUnreal teams worked hard to maintain binary compatibility with older native mods.
Most of these mods will continue to work in version 469a. However, some mods may need some trivial updates.
If you are a native mod author, and you are having trouble updating your mod for version 469, then please reach out to us at [the OldUnreal forums](https://www.oldunreal.com/cgi-bin/yabb2/YaBB.pl?board=nativemods).
**Note:** This patch disables older versions of ACE.
Server admins should upgrade ACE to version 1.1e or later to check 469a clients.

### Stability Improvements

#### Unreal Editor

* Fixed an issue that caused UnrealEd to crash if the EditPackages list did not contain any packages with meshes in them.
* Fixed an issue that caused UnrealEd to crash when opening large UnrealScript files.
* Fixed an issue that caused UnrealEd to crash when opening packages with array variables in them.
* Fixed an issue that caused UnrealEd to crash during shutdown. This issue likely only affected Windows 10 users.
* Fixed an issue that caused UnrealEd to crash when reloading a map after rebuilding several packages.
* Fixed an issue that caused UnrealEd to crash while editing maps with lots of dynamic lights.
* Fixed an issue that caused UnrealEd to crash when docking/undocking one of the browser windows.
* Fixed an issue that caused certain commandlets to crash because the garbage collector decided to destroy them while they were still running.
* Fixed an issue that caused the ucc batchexport commandlet to crash when exporting textures from a package containing scripted textures.

#### Game Client

* Fixed an issue that caused the game to crash when running the "GET" consolecommand to read an array property.
* Fixed an issue that caused the game to occasionally crash on shutdown.
* Fixed an issue that caused the game to crash when calling certain canvas functions with an invalid font or texture argument.
* Fixed an issue that caused the game to crash if the player deleted the [Engine.GameEngine] group from the UT.ini file.
* Fixed an issue that caused the game to crash when resetting properties to their default values in the preferences window.
* Fixed an issue that caused the game to crash when attempting to call an unrealscript function that has the same name as a global variable within the same class.
* Fixed dozens of issues that caused the game to crash when exporting properties in textual format (e.g., through GetPropertyText).
* Fixed various issues that caused the game to crash after destroying objects containing dynamic arrays.
* Fixed various issues that caused the game to crash when rendering scenes with lots of actors/dynamic sprites in them.
* Fixed an infinite recursion crash bug triggered when picking up an invisibility powerup while already invisible.
* Fixed an issue that caused certain maps to crash the game due to duplicate actors in the map.
* The game now properly nullifies references to all destroyed actors. This change fixes the garbage collector crashes that triggered when an Actor was referred to by an Actor in a different level, or when a non-Actor object kept an implicit or explicit reference to a destroyed Actor.
* Fixed a bug that caused the game to crash when using the "QUIT" or "EXIT" command during demo playback.
* Fixed a bug that could cause the game to crash while recording a demo on a server that generates excessive amounts of traffic on single actor channels. One of the mods that often triggers this bug is Nexgen.
* Fixed a bug that caused the game to crash when calling an iterator function in a null context.
* Fixed a bug that caused the game to crash in maps that had brushes with bStatic and bNoDelete set to false.

#### Game Server

* Fixed aluigi's unrealfp Remote Server DoS bug.
* Fixed an issue that caused the server to crash in AActor::execPlayerCanSeeMe in games with bots in them.

### Bug Fixes

#### Unreal Editor

* Fixed an UnrealEd issue that caused vertices/brushes to become invisible while zooming in in vertex edit mode.
* Fixed an UnrealEd issue that caused brush clips to snap to the nearest grid location when clicking a vertex.
* Fixed an UnrealEd issue where Actors could not be placed/deleted/edited if an Actor with the same name already existed elsewhere in the class hierarchy.
* Fixed an UnrealEd issue where the 3D viewports used incorrect lightmaps after rebuilding lighting/bsps.
* Fixed an issue that caused incorrect brush stretching/scaling on non-builder brushes.
* Fixed an issue that caused UnrealEd to show all textures in the game when selecting a font group in the Texture Browser.
* Fixed an issue that caused erratic mouse cursor behavior when dragging in an orthogonal zoom viewport.
* Fixed an issue that caused MyLevel resources to become corrupted after loading a new map in UnrealEd.
* Fixed an bug that caused the texture browser scrollbar to reset when scrolling down a long list of textures.
* Fixed various text clipping bugs in the texture browser window.
* Fixed a bug that caused v436-v451 to crash when rendering LOD meshes imported with UT v440 or later.
* Fixed a bug that made UnrealEd truncate large files in the code editor window.

#### Physics and Player Movement

* Fixed an issue where the game would speed up dramatically when rendering more than 200 frames per second.
* Fixed a bug that could cause dodge moves to be delayed.
* Fixed a bug that caused the server to constantly and incorrectly adjust the client's in-game position. This caused choppy movement when rendering more than 90 frames per second.
* Fixed a bug that caused players to get stuck in walls or slopes when playing with high frame rates. This bugfix will only work on v469a servers.
* Fixed a bug that caused extremely large position adjustments when walking sideways into sloped brushes. This bugfix will only work on v469a servers.
* Fixed several bugs that allowed certain projectiles to ignore collision with level geometry.

#### Input and Windowing

* Fixed a bug that caused the scrolling animation in the preferences window to play in the opposite direction.
* Fixed an issue where you could not select property values containing spaces in the preferences menu.
* Fixed an issue where the mouse would get stuck in the middle of the game window on Linux and Mac.
* Fixed an issue where the in-game windowing system would sometimes show a wait cursor instead of a west-east window resizing cursor.

#### Networking and Netcode

* Fixed a bug that could cause carried weapons and flags to become invisible in online games.
* Fixed a bug that caused XC_Engine servers to reject connections from players who had just watched a demo.
* Fixed several issues that caused network connections to be terminated unexpectedly on Linux and Mac.

#### Audio and 3D Rendering

* Fixed an issue where the game would only show part of the player model in the player setup menu.
* Fixed an issue where the game would shut down when a non-fatal rendering anomaly occurred.
* Fixed a bug that caused the game viewport to have the wrong dimensions after resizing the game window on Linux or Mac.
* Fixed several bugs that caused sounds not to update or to play from the wrong location.
* Fixed a bug that caused the game to crash at extremely high resolutions (such as 8K).
* Fixed an issue where the game would not update stale actor lighting data in the engine cache. As a result, many actors would be renderered in pitch black even when they should be lit. This issue especially affected people playing with large cache sizes or high frame rates.
* Fixed a bug that caused CTF Flags to become dark after being returned to their flag base.
* Fixed an issue where certain sounds would play at double the intended volume while recording a demo.
* Fixed an issue where screenshots would not get rendered correctly if you had your vertical screen resolution set to an odd number of pixels.
* Fixed a bug that caused all decorations in skyboxes to be invisible.
* Fixed a bug that caused the game to stop rendering after changing your FOV in a game type that had its MinFOV and MaxFOV settings set to 0.

#### Miscellaneous

* Fixed an issue where the game would hang for a long time (and sometimes even crash) when opening a maplist with lots of maps.	
* Restored the ability to kick players and bots from local games.
* Fixed an issue where bots considered human players invisible even after their invisibility pickup had expired.
* Fixed several bugs that could cause weapons to instantly switch between fire and alt fire animations.
* Fixed a bug that allowed players to interact with the level and pick up items before the match started after giving up admin privileges via AdminLogout command.
* Team games now properly end when one of the teams scores in overtime.
* The 1024 character limit on conversions between ANSI and Unicode strings is gone.
* Fixed an engine bug that could cause Demo Manager to freeze the game after using the seekto command.
* Eliminated many "Accessed None" warnings.
* Pawns that get destroyed while they have the Destroyed probe function disabled should now get unlinked from the Level Pawnlist.

### Enhancements

#### Unreal Editor

* Merged most of Unreal 227's Unreal Editor enhancements.
* UnrealEd's viewport window allows you to select any of your renderdevices now (not just SoftDrv and D3DDrv).
* UnrealEd's button bar and texture browser now have mouse wheel support.
* UnrealEd's 2D Shape Editor now properly calculates the vertex positions while dragging at zoom levels other than 100 pct.
* UnrealEd now supports mouse wheel scrolling in the 2D viewports.
* UnrealEd now has an "Add PlayerStart" item in the surface popup menu. This item only shows if your level does not have a PlayerStart yet.
* UnrealEd viewports can now render up to 200 frames per second. This framerate was previously capped at 30.
* UnrealEd's vertex editor now properly accumulates small vertex adjustments. Previously, small adjustments could get discarded due to grid snapping.
* Added texture format conversion support to the texture browser.
* Added an option to remove the compressed mips from a texture in the texture browser.
* All UnrealEd viewports now support renderdevice switching.
* Added texture import support for various new image formats.
* The ucc make commandlet now works on Linux and Mac.
* The ucc compress commandlet can now skip compression if an up-to-date .uz file already exists. To use this new feature, add the "update" command line parameter to your ucc compress invocation.
* S3TC/DXT1 texture compression should now be available in the ucc tools for Linux and Mac (though obviously not in UnrealEd).

#### High-resolution Support

* UnrealEd, Setup, and the game client are now high-DPI aware on Windows. This eliminates the bluriness a lot of people with big monitors were seeing. It also improves input precision in the game and the editor.
* Added automatic scaling of the game menu. The scaling factor and behavior can be controlled using the new settings in the menu.
* Added crosshair scaling to the standard HUD. You can configure the crosshair scaling settings in the menu. NOTE: A lot of mods will likely ignore the crosshair scaling. Mod authors should update their mods so they call the regular ChallengeHUD.DrawCrosshair function.
* Added in-game font scaling. When enabled, fonts scale automatically with your desktop DPI. Scaling can be turned on and off in the in-game menu.
* UWindow now supports higher resolution textures for LookAndFeels. This enables LookAndFeels to scale better for people playing at higher resolutions and higher GUI scales. The UMenu LookAndFeels have been (partially) updated to use this new feature.

#### Input and Windowing

* Fixed mouse acceleration issues for players using DirectInput on Windows 10.
* Added raw mouse input support. This feature can be enabled by setting the UseRawHIDInput to true in the WinDrv.WindowsClient section of the game ini.
* Added enhanced pointer precision control. By default, the game enables enhanced pointer precision while in the menu and restores the old precision settings when in game. However, you can now set the NoEnhancedPointerPrecision option in the WinDrv.WindowsClient section to true if you do not want the game to change the system pointer precision settings at all.
* Added new menu options to control the mouse input and smoothing behavior.
* Improved support for mouse side buttons.
* Added mouse wheel scrolling support to the in-game windowing system.
* Added clipboard paste support to the quick console.
* The Linux and Mac clients now have clipboard support.

#### UnrealScript

* Console commands that are over 1024 bytes in length, or that return over 1024 bytes of data should now be safe to use.
* Added a new primitive type called "pointer". Pointer variables automatically adjust to the word width on the target platform. Native mod authors should use pointer variables to mirror a pointer type in C++.
* Added new Canvas functions to create arbitrarily-sized fonts on the fly. Please do not use these functions directly as they will cause your mod to be incompatible with earlier versions of UT. Instead, use the BotPack.FontInfo class to retrieve fonts that are appropriate for the client's screen size.
* Added the "TEXTURE MERGECOMPRESSED NAME=MergeWith FILE=HiResFile.PNG GROUP= " exec command. This command allows you to import and compress hi-res textures and merge them into an existing texture's compressed mipmaps.
* Added HandlePauseRequest to the mutator system, allows modders to modify the behaviour of players' pause button in servers.

#### Security

* Fixed several arbitrary code execution vulnerabilities.
* The Windows version of the game now has several security enhancements including (but not limited to) Data Execution Prevention (can be disabled with the -nodep command line parameter), SafeSEH, and ASLR support.

#### Anti-Cheat

* Revamped the UT v468 MD5 code. Older clients can connect to v469a servers now even if they don't support the MD5 extension. The server now also marks which files it wants MD5 checks for.
* MD5 checking is now disabled by default. To enable, set MD5Enable to True under [Engine.GameEngine] in the server's ini file.
* Added an auto-updater for the Packages.md5 list. The auto-updater will check for list updates once an hour if you have MD5Enable and MD5AutoUpdate both set to true under [Engine.GameEngine].

#### Networking and Netcode

* Restored demo compatibility with UT v436.
* Added workarounds for bugs that could cause player animations to break in demos or online play after installing high-resolution S3TC textures.
* Made improvements to the networking code to eliminate the infamous texture skating problem (in nearly all cases).
* The game no longer disables Download Managers if they encounter a non-critical error while attempting to download a file from the server. Previously, the game would stop attempting to download from redirect servers after encountering an HTTP error (such as HTTP 404).
* The game now shows the number of remaining packages while downloading from a server.
* Clients are far less likely to encounter package mismatch errors when connecting to servers, now a UT client can have multiple packages with the same name and the loader will select the right one (if present).
* Added bandwidth control for file downloads from the gameserver. The bandwidth control option overrides the MaxClientRate. It can be controlled in the server.ini file as follows:
```
[IpDrv.TcpNetDriver]
MaxFileDownloadRate=0   Maximum download speed in bytes per second

; Possible values for MaxFileDownloadRate:
; -1                    Send files at the maximum speed possible
;  0                    Limit the file download speed to MaxClientRate bytes per second. This is what UT did by default in versions 468 and below
;  any positive number  Allow download speeds of up to this amount of bytes per second.
```

#### Audio and 3D Rendering

* Screenshots now get stored in the "System/Screenshots" folder. UT will automatically create this folder if it does not already exist. We also removed the limit on the number of screenshots you can have in this folder and we now save screenshots in PNG format rather than BMP.
* Decals are now visible in fog zones.
* Integrated Cluster, a new FMOD-based audio driver with superior sound quality and hyper-realistic sound effects (Thanks han!).
* Integrated enhanced versions of Chris Dohnal's UTGLR OpenGLDrv and D3D9Drv. 
* Integrated OldUnreal's latest XOpenGLDrv. 
* Galaxy Audio is now considered deprecated. On Windows Vista and later, the game launcher will do an automatic one-time upgrade your audio subsystem to the latest version of the OldUnreal Cluster driver.
* Revamped the underlying audio code for sounds played using TournamentPlayer.ClientPlaySound. The revamped code should make playback volumes more consistent and should eliminate audio glitches such as crackling and screeching.

#### Miscellaneous

* UnrealEd and the game client are now large address aware on Windows. This means it is far less likely that you'll run out of virtual memory.
* Removed some outdated items from the in-game menu (e.g., ngWorldStats, mplayer, heat, won, ...)
* Rewrote some of the core timing routines so the game runs more smoothly (and with less glitching) on multicore CPUs and in long-running games.
* The Linux and Mac clients finally support unicode! The most visible consequence is that player names with non-ascii characters in them will now display correctly when playing on Linux servers (provided that you use font textures with the proper unicode glyphs).
* The game now uses UTF-8 as the prefered file encoding (unless a UTF-16LE BOM is found at the start of the file).
* Added selectedcursor support to the Linux and Mac clients.
* Added the -FORCELOGFLUSH command line option. This option makes the game/server flush the log file every time it is written to.
* Added the -SETHOMEDIR= command line option. Normally, the game looks for the UnrealTournament.ini and User.ini files in \~/.utpg/System (on Linux), \~/Library/Application Support/Unreal Tournament/System (on Mac), or in UnrealTournament\System (on Windows). With this option, you can override the preferences path (e.g., ./ut-bin-x86 -sethomedir=\~/.loki/ut/System).
* Made pulsegun and minigun lockdown a configurable option that is disabled by default.
* UnrealI and UnrealShare decorations can no longer be destroyed if they have bStatic set.
* Merged Unreal 227's UnrealI and UnrealShare AI fixes.

## Old Release Notes

The release notes for older patches released by Epic and UTPG can be found in the Help/ReleaseNotes.htm file which is included in the patch.