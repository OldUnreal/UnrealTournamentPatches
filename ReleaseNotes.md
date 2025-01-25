# Unreal Tournament Release Notes

## General Information

### Official Unreal Tournament Web Sites

* [Unreal Tournament Home Page](https://www.unrealtournament.com)
* [Epic Games Home Page](https://epicgames.com)
* [Unreal Engine Technology Page](https://www.unrealengine.com)

### Independent Unreal Tournament Web Sites

* [UT99.org - Unreal Tournament Community](https://ut99.org)
* [OldUnreal](https://www.oldunreal.com)

## Unreal Tournament Version 469e Release Notes [ Release Candidates are now available! ]

Version 469e is completely network compatible with all previous public releases of UT (down to 432).
The UTPG and OldUnreal teams worked hard to maintain binary compatibility with older native mods.
Most of these mods will continue to work in version 469e. However, some mods may need some trivial updates.
If you are a native mod author, and you are having trouble updating your mod for version 469e, then please come talk to us on [Discord](https://discord.gg/thURucxzs6).
**Note:** This patch disables older versions of ACE.
Server admins should upgrade ACE to version 1.3g or later to check 469e clients.

### Patch Highlights

* We added dozens of major quality-of-life features to Unreal Editor
* Our Windows patches now include two great DirectX 11-based renderers: Metallicafan212's ICBINDx11 and dpJudas' D3D11Drv.
These renderers offer great performance, low input latency, and lots of features.
However, they will only work on recent versions of Windows and require a somewhat recent GPU
* Apple users rejoice! This patch includes a brand new renderer that will talk to your machine using Apple's Metal API.
You can enable this new renderer by setting the GameRenderDevice option in the [Engine.Engine] section of your game ini to Frucore.FrucoreRenderDevice.
Please note that we couldn't call this renderer MetalDrv because that name is still taken by the renderer that targets S3's Metal API
* The Windows and Linux patches now ship with dpJudas' VulkanDrv
* By popular request, we added widescreen FOV scaling to the game (thanks Masterkent!)
* The in-game server browser now needs much less time to populate the server list

### Stability Improvements

#### Unreal Editor

* Fixed a bug that could make Unreal Editor crash when deleting an actor whose Level property still referred to a deleted LevelInfo object ([#1400](../../issues/1400))
* Fixed a bug that could make Unreal Editor crash when adding mipmaps to a compressed texture without P8 mips ([#1395](../../issues/1395))
* Fixed a bug that could make Unreal Editor crash when building lights on very large maps
* Fixed a bug that made Unreal Editor crash when loading a map that actors whose names clash with names of actors on the previously loaded map ([#448](../../issues/448))
* Fixed a bug that could make Unreal Editor crash after deleting actors ([#1069](../../issues/1069))
* We fixed several bugs that crashed UCC while importing meshes on Linux and macOS ([#1507](../../issues/1507))
* We fixed a bug that crashed Unreal Editor when tapping the delete key in an empty group browser window

#### UnrealScript

* We fixed a bug that could make the game crash due to a runaway loop in Botpack.Bot.TakeHit

#### Audio and 3D Rendering

* Fixed a bug that could make the game or editor crash when rendering an actor mesh without a texture ([#700](../../issues/700))
* Fixed a bug that could make SoftDrv crash when rendering certain meshes ([#545](../../issues/545))
* Fixed a bug that could make the game or editor crash when enabling bFilterByVolume on certain actors ([#699](../../issues/699))
* Fixed a bug that made the game freeze and eventually crash when rendering an incorrectly linked portal ([#522](../../issues/522))
* We fixed a bug that could make the game crash when rendering a mover with an origin point in an invalid zone ([#1670](../../issues/1670))
* We fixed a bug that made OpenGLDrv crash on certain older GPU drivers

#### Networking and Netcode

* Fixed a bug that could make the game crash when connecting to a server after executing the "reconnect" console command on the entry map ([#826](../../issues/826))
* Fixed a bug that could make the game crash when executing the "reconnect" console command after watching a demo ([#1280](../../issues/1280))
* Fixed a bug that crashed the game when loading a map with the LevelInfo.bLonePlayer flag set to true ([#1461](../../issues/1461))
* Fixed a bug that made the ucc masterserver commandlet hang (on the first press) and then crash (on the second press) when pressing CTRL+C ([#1504](../../issues/1504))
* Fixed a bug that made the game crash when trying to play a demo file that depends on missing packages ([#1601](../../issues/1601))
* We fixed two bugs that could make the UZ decompression code crash while creating or destroying threads ([#1674](../../issues/1674))

#### Physics and Player Movement

* Fixed a bug that could make the game crash when a bot tried to move around on a map with invalid paths ([#1097](../../issues/1097))
* We fixed a bug that could crash the game in the APawn::TraverseFrom function

#### Input and Windowing

* Fixed a bug that could crash the game or editor after changing a large number of properties in a properties window ([#1491](../../issues/1491))

#### Miscellaneous

* Fixed a bug that made the game crash on startup on macOS Sonoma 14.4 ([#1549](../../issues/1549))
* We implemented a workaround for a bug that made the game crash while shutting down on some Linux systems (e.g., Linux Mint 22)
* We removed libopenal.so.1 from the Linux tarballs. To play the game with ALAudio, you will now have install OpenAL-soft using your system's package manager

### Bug Fixes

#### Networking and Netcode

* The IpDrv.UdpLink.ReceivedBinary() and IpDrv.TcpLink.ReceivedBinary() events should now reliably receive all incoming data
* We fixed a thread synchronization problem in the hostname resolution code that could make address lookups fail unexpectedly
* We fixed a resource leak in IpDrv. Over time, this resource leak could break the in-game server browser

#### Unreal Editor

* Fixed a bug that made it impossible to undo a cut operation on a NavigationPoint ([#1242](../../issues/1242), [clip](https://www.youtube.com/watch?v=PMpERQUIaqE))
* Fixed a bug that made it impossible to undo a right-click operation on a vertex ([#1168](../../issues/1168), [clip](https://www.youtube.com/watch?v=e0lrd3dFnDE))
* Fixed a bug that made Unreal Editor deselect the currently selected actors when pressing "Show Selected Actors Only" ([#1039](../../issues/1039), [clip](https://www.youtube.com/watch?v=LdhIR5OmZ-k))
* Unreal Editor should now correctly initialize all pivot components when placing a pivot in an ortho viewport ([#969](../../issues/969), [clip](https://www.youtube.com/watch?v=XPEOLWW3vg4))
* Unreal Editor will now show the correct map name after failing to load a map ([#825](../../issues/825))
* Unreal Editor will no longer clear the Region of all level actors after pasting an actor ([#621](../../issues/621))
* The mesh and texture browsers should now ignore CAMERA ALIGN commands ([#516](../../issues/516))
* Fixed a bug that made the texture browser show the wrong texture type for textures that only contain compressed data ([#1411](../../issues/1411))
* Fixed a bug that could make movers move or rotate inadvertently after building lights ([#1342](../../issues/1342))
* Fixed incorrect lighting of movers whose BrushRaytraceKey differed from their WorldRaytraceKey ([#668](../../issues/668), [clip](https://www.youtube.com/watch?v=fKPAzylbb9U))
* Unreal Editor will now update the pivot location after resetting brushes ([#273](../../issues/273))
* Fixed bugs that could make grid lines not render correctly ([#694](../../issues/694), [#695](../../issues/695))
* Fixed a bug that made vertices move too quickly when editing them in a maximally zoomed viewport ([#1419](../../issues/1419))
* Fixed a bug that made Unreal Editor ruin texture alignment when editing/transforming brushes ([#1161](../../issues/1161), [#1166](../../issues/1166), [clip 1](https://www.youtube.com/watch?v=VdPmMeCvdSQ), [clip 2](https://www.youtube.com/watch?v=Gve81ocdtls))
* Fixed several bugs that made it nearly impossible to vertex edit in 3D viewports ([#1299](../../issues/1299), [clip](https://www.youtube.com/watch?v=sueiduvgWM4))
* Fixed a bug that could make the active brush render incorrectly after importing an OBJ file ([#1422](../../issues/1422))
* The texture rotate command now works as expected for unproportionally scaled textures ([#1431](../../issues/1431), [clip](https://www.youtube.com/watch?v=y7l8aZTXDXk))
* Copy-pasting surface properties between surfaces with different orientations should now work as expected ([#1220](../../issues/1220))
* Fixed a bug that could cause vertices moved with ALT+LMB not to snap to the grid, even if the "snap to grid" option was enabled ([#1421](../../issues/1421))
* Unreal Editor will no longer prevent you from overwriting packages it previously failed to load ([#578](../../issues/578))
* Fixed a bug that made the path builder inadvertently modify the collision settings of map actors ([#574](../../issues/574))
* Fixed a bug that could make Unreal Editor export certain textures, sounds, and music files using the wrong name ([#1273](../../issues/1273))
* The actor browser should now select the correct class when pressing the "..." button for an actor property in the properties window ([#1326](../../issues/1326), [clip](https://www.youtube.com/watch?v=UldakgYEhMw))
* Fixed a bug that made the 2D shape editor revolve function calculate incorrect texture rotation angles ([#1426](../../issues/1426), [clip](https://www.youtube.com/watch?v=XxEYMB0DzJk))
* Fixed a bug that could make actor properties window freeze when editing actors that refer to each other ([#1462](../../issues/1462))
* Fixed a bug that made Unreal Editor produce small "dead zones" near invisible surfaces in some instances ([#554](../../issues/554), [clip](https://www.youtube.com/watch?v=FWZdeBfPCM4))
* Fixed a bug that made Unreal Editor randomly produce dark areas on a "bright corners" surface (backport from Unreal 227) ([clip](https://www.youtube.com/watch?v=C4cz153NXBE))
* Fixed a bug that could make Unreal Editor hide identical property values in the actor browser when selecting multiple actors ([#270](../../issues/270))
* Fixed several bugs that made the path builder build invalid or superfluous paths ([#129](../../issues/129), [clip](https://www.youtube.com/watch?v=0FoSmliMPnw))
* Fixed a bug that made the TrueType font factory ignore single characters in UnicodeRange parameters of exec commands ([#1482](../../issues/1482))
* The mesh browser window should now have a menu when it is undocked ([#1447](../../issues/1447))
* Fixed a bug that made ucc make insert erroneous casts in some cases ([#1500](../../issues/1500))
* Fixed a bug that made Unreal Editor rebuild selected movers after using the "Show Polys" command ([#784](../../issues/784))
* Fixed a bug that made surface polygons non-solid if one of their origin was outside the map boundaries (backport from Unreal 227) ([#1509](../../issues/1509))
* Fixed several rounding errors throughout the editor code
* Fixed a bug that could change the texture selection during rebuild operations ([#660](../../issues/660))
* Fixed a bug that made non-scalable actors such as inventory float in the air after using the map scaling tool ([#1514](../../issues/1514), [clip](https://www.youtube.com/watch?v=xYjfFQ0-rEw))
* Fixed a bug that made the editor skip the compilation of new classes until you had modified their initial code ([#133](../../issues/133))
* Fixed a bug that could destroy brushes when zooming or moving the camera while vertex editing ([#1540](../../issues/1540), [clip](https://www.youtube.com/watch?v=5B7kqjmnUkY))
* Fixed a bug that could destroy texture alignment for surfaces on which you had used OneTile alignment prior to rebuilding the map ([#1543](../../issues/1543))
* Fixed a bug that corrupted brushes when undoing certain editor operations
* Fixed a bug that made the brush importer corrupt the texture UV alignment on non-triangulated brushes ([#1560](../../issues/1560))
* Fixed a bug that made Unreal Editor discard the saved camera positions when loading a map ([#651](../../issues/651), [clip](https://www.youtube.com/watch?v=GwyFtyzm0dc))
* Fix several bugs that made Unreal Editor lose track of the modification status of the map ([#289](../../issues/289), [#490](../../issues/490), [#615](../../issues/615))
* Fixed several decompilation bugs in ScriptRays, including a bug that caused decompilation failures in functions that called Engine.Actor.Spawn ([#1570](../../issues/1570))
* Fixed a bug that could make editor windows disappear on multi-monitor systems ([#1556](../../issues/1556))
* Fixed a bug that could make the editor execute both the modified and unmodified versions of keyboard commands when you released keys in the wrong order ([#1588](../../issues/1588))
* Fixed a bug that made it impossible to access a class member variable when a function with the same name was in scope ([#902](../../issues/902))
* Fixed a bug that could make the camera turn upside down after clicking an actor in the "Search For Actors" menu ([#1627](../../issues/1627))
* Fixed a bug that could trigger unintentional click actions when starting a box selection ([clip](https://www.youtube.com/watch?v=TG7NrV1fq6w))
* Fixed a bug that made it difficult to place actors onto movers ([clip](https://www.youtube.com/watch?v=Rd93-Tk8uOA))
* Fixed a bug that made duplicated movers move to an incorrect position if their key position was not set to 0 at the time of the duplication ([clip](https://www.youtube.com/watch?v=Mtx7samlQxo))
* Fixed several bugs that made the 2D shape editor destroy the shape you were editing ([clip 1](https://www.youtube.com/watch?v=Ql87D0jXIE4), [clip 2](https://www.youtube.com/watch?v=77VycA8biG4))
* Fixed a bug that made the editor show an incorrect 3D bounding box for movers ([clip](https://www.youtube.com/watch?v=4q5l7AOujaE))
* Fixed a bug that made it impossible to draw fire textures in texture properties windows ([clip](https://www.youtube.com/watch?v=cBFDVtlO9UY))
* We fixed a bug that made it impossible to delete certain unused textures ([#1576](../../issues/1576))
* We fixed a bug that could make Unreal Editor destroy brushes whose points/planes collapsed while vertex editing
* We fixed a bug that made it impossible to select music and sound objects in groups
* We fixed a bug that broke bezier line segments after using the rotate function in the 2D shape editor

#### UnrealScript

* Fixed a bug that could cause the game's random number generator to generate invalid numbers in rare cases. One known side effect of this bug is that paths could stop working in online games on certain maps ([#389](../../issues/389))
* Fixed a bug that caused a mismatch between the Level.Millisecond and Level.Second values on Linux/Mac servers ([#1064](../../issues/1064))
* Fixed a bug that made it impossible to select certain skins (such as the Atomic Cow skin) in the in-game player setup menu ([#362](../../issues/362))
* Fixed a bug that made the LevelInfo timer ignore changes to the game speed ([#1302](../../issues/1302))
* UBrowserHTTPClient should now report the correct HTTP error code for large error pages ([#1350](../../issues/1350))
* Fixed a bug that made the teleport effect play twice for bots spawning with bSpawnInTeamArea set to true ([#1387](../../issues/1387))
* Fixed a bug that made the game destroy your default weapon if you placed a destructive zone at the level origin ([#1020](../../issues/1020))
* Fixed an overflow bug that could make bots behave erratically and produce high CPU load when the "Auto Adjust Skill" option was enabled ([#1489](../../issues/1489))
* Fixed a bug that allowed you to continue giving orders to bots after the game had ended ([#1070](../../issues/1070))
* Fixed a bug that broke the Engine.ScriptedTexture.ReplaceTexture() function ([#1592](../../issues/1592))
* Fixed a bug that could cause runaway loop crashes in ScriptedPawn.RangedAttack
* Fixed a bug that prevented you from jumping if you had your DefaultPlayer.Name setting in User.ini set to a blank value ([#1623](../../issues/1623))
* We fixed a bug that made SaveConfig() save values with trailing spaces or trailing quotes incorrectly ([#1686](../../issues/1686))
* The "RELOADCONFIG" console command should now correctly handle perobjectconfig objects and classes
* We fixed a bug that made pressure zones and vacuum zones reset your FOV to the default value
* Selecting partial lines across line breaks should now work as expected in DynamicTextAreas
* We fixed an issue that made text in certain types of UWindow windows render with a small offset after selecting it

#### Physics and Player Movement

* Fixed a bug that allowed AI-controlled Pawns to touch and pick up inventory even if their bCollideActors flag was set to false ([#773](../../issues/773))
* Fixed a bug that could cause actors to get stuck in mid air in some cases ([#652](../../issues/652), [clip](https://www.youtube.com/watch?v=Y3kM3UUQu_c))
* Fixed a bug that could cause actors/players to get stuck when they try to walk up a small step ([#866](../../issues/866))
* Fixed a bug that could make bots run around aimlessly near ledges they wanted to jump down from ([#1568](../../issues/1586))
* Fixed a bug that made human players' view vibrate along the Z-axis when standing on a mover ([#720](../../issues/720), [#1621](../../issues/1621))
* We fixed several collision bugs while maximally preserving compatibility with maps and mods that rely on quirks of the old collision code. We also added a new FixUpMoversBoundingBox option to the [Engine.GameEngine] section of the game ini. If this option is set to a non-zero value, the game and editor will detect and, potentially, fix up movers whose bounding box does encompass all inner collision hulls. If set to 1, we will expand the outer bounding box so all inner collision hulls become part of the outer bounding box. If set to 2, we will limit the size of the expansion to ensure the mover behaves (almost) identically in pre-469e clients/servers and post-469e clients and servers. The default value of FixUpMoversBoundingBox is 2 ([#1653](../../issues/1653), [#1655](../../issues/1655), [#1672](../../issues/1672))

#### Audio and 3D Rendering

* The game will now render sprites, meshes, and effects that are visible through portals in their correct locations ([#654](../../issues/654), [#1448](../../issues/1448), [#218](../../issues/218), [clip](https://www.youtube.com/watch?v=TH00uNX8uYk))
* Fixed a bug that could make textures stop panning after a while ([#1374](../../issues/1374), [clip](https://www.youtube.com/watch?v=P1dRlbMDy_A))
* Fixed an arithmetic bug in the Actor.LifeFraction function that made some actors (e.g., muzzle flashes) render incorrectly ([#625](../../issues/625))
* Fixed a bug that made movers render incorrectly in levels with fully unlit level models ([#1417](../../issues/1417))
* Fixed a bug that made movers flicker on certain maps ([#1469](../../issues/1469), [clip](https://www.youtube.com/watch?v=weCXA7B0Axo))
* Fixed a bug that made invisible collision hulls prevent lights from illuminating meshes ([#1508](../../issues/1508), [clip](https://www.youtube.com/watch?v=8hsCbOhHKos))
* Fixed a bug that made decals produce flickering artifacts if they were placed near the edge of a surface ([#1510](../../issues/1510), [clip](https://www.youtube.com/watch?v=ATrhbseaKlo))
* Fixed a bug that caused animation of ice textures to stop at high frame rates
* Fixed a bug that made certain meshes disappear when viewed from certain angles/positions ([#1414](../../issues/1414), [clip](https://www.youtube.com/watch?v=2N50hljvBDA))
* Fixed a texture corruption issue in SoftDrv ([clip](https://www.youtube.com/watch?v=0xmejgUDrEk))
* We fixed a bug that made ALAudio unable to play certain mp3 files
* We fixed a bug that could make OpenGLDrv render dynamic textures as plain black textures

#### Input and Windowing

* Fixed a bug that could make the game lose mouse focus, hide the mouse cursor, or enforce incorrect mouse cursor clipping bounds when entering fullscreen mode ([#1261](../../issues/1261), [#1000](../../issues/1000), [#488](../../issues/488), [#1472](../../issues/1472))
* Fixed a bug that made Unreal Editor lose focus when undocking or closing all browser windows ([#728](../../issues/728))
* Fixed a bug that made the minimize button disappear in some cases when switching to windowed mode ([#1546](../../issues/1546))
* Fixed a bug that could get the game stuck in a window resizing loop on Linux and macOS ([#1158](../../issues/1158))
* Fixed a bug that made it impossible to relaunch the game after changing video settings on Linux and macOS
* We fixed a bug that made you switch weapons when ALT+TAB'ing in and out of the game ([#1701](../../issues/1701))

#### Localization

* Fixed a bug that made it impossible to localize the names of certain skins displayed in the in-game player setup menu

#### Game Client

* Fixed a bug that made it impossible to delete recently recorded demos ([#1290](../../issues/1290))
* Common render device options such as VolumetricLighting and Coronas will now show up in the Options subcategories in the preferences window ([#1262](../../issues/1262))

### Enhancements

#### Networking and Netcode

* Servers will now correctly replicate the value of config variables that appear in replication blocks
* The in-game server browser now correctly decodes UTF-8-encoded server names and server info
* The "SOCKETS" console command now shows detailed traffic statistics for individual channels
* We added a "DEVNETTRAFFICLOGS" console command that enables logging of replication traffic ([#722](../../issues/722), [clip](https://www.youtube.com/watch?v=KYVbpHcKGKE))
* The game client will no longer capture Engine.SavedMove objects in demo recordings. This should make demos substantially smaller

#### Unreal Editor

* Undoing a texture rotate operation now correctly restores all rotated textures at once ([#1167](../../issues/1167), [clip](https://www.youtube.com/watch?v=6Hxy412ykP0))
* Unreal Editor now gracefully handles failures to spawn actors during t3d import operations ([#549](../../issues/549))
* Improved readability of texture browser labels ([#959](../../issues/959))
* You can now undo/redo vertex editing operations ([#677](../../issues/677), [clip](https://www.youtube.com/watch?v=KCG9XkPVjqc))
* The POLY SELECT MATCHING BRUSH command will now select the surfaces of all selected brushes if no surfaces are initially selected ([#667](../../issues/667), [clip](https://www.youtube.com/watch?v=eHRDz5Egdb4))
* Unreal Editor will now merge all zones without a ZoneInfo actor into one zone whenever we would otherwise exceed the maximum number of zones ([#690](../../issues/690))
* Clarified the text in the map cleanup tool dialog ([#904](../../issues/904))
* Ortho viewports will now calculate the LODBias value for rendered meshes based on the viewport zoom level rather than the distance between the camera and the mesh ([#262](../../issues/262), [clip](https://www.youtube.com/watch?v=2m4DymUMqf4))
* Unreal Editor will no longer select camera viewports when box selecting ([#829](../../issues/829), [clip](https://www.youtube.com/watch?v=yvR9TtZTxAU))
* Added or improved compiler warnings for several erroneous or dangerous operations ([#301](../../issues/301), [#853](../../issues/853), [#1420](../../issues/1420))
* Unreal Editor now shows the surface skew and angle in the stats tab of the surface properties window ([#924](../../issues/924), [clip](https://www.youtube.com/watch?v=wxd2O0stg-A))
* You can now configure the lightmap scale/level of detail in the Unreal Editor build menu ([#1416](../../issues/1416), [clip](https://www.youtube.com/watch?v=AH5OLNLZDPQ))
* Unreal Editor no longer spams the log file with messages during path building ([#1413](../../issues/1413))
* It is now possible to undo/redo the hide selected actors and invert actor selection commands ([clip](https://www.youtube.com/watch?v=NWapJOO38EY))
* Added menu options for separating, merging, and flipping the polygons of the selected surfaces
* You can now select the surfaces of all selected brushes using the SHIFT+B shortcut or using a new "Select Surfaces" menu option ([clip](https://www.youtube.com/watch?v=Fzwo4ZyCy88))
* Improved scrolling performance in the texture browser
* Unreal Editor now shows the game build date and version in the main window ([#1221](../../issues/1221))
* The actor browser now retains the expanded state for each actor in the tree after refreshing
* Added a 2D shape editor option that imports the shape of selected surfaces or brushes
* The texture properties and replace dialogs will now render textures using the texture browser's renderer ([#1276](../../issues/1276))
* The code editor will now save the source code of the class you're currently editing when you click the export scripts button
* Unreal Editor will no longer open docked browser windows when it launches ([#1298](../../issues/1298))
* Added a 2D shape editor option that clears the shape you're currently editing ([#1378](../../issues/1378), [clip](https://www.youtube.com/watch?v=_6T4_t0M50Q))
* Unreal Editor will now show the size of the current selection rectangle in Unreal Units ([#1377](../../issues/1377))
* Unreal Editor will now warn you when one of the content browsers fails to save a package ([#686](../../issues/686))
* Added a surface menu option to select non-coplanar polygons ([clip](https://www.youtube.com/watch?v=ZcmbFMoIPP8))
* Added a menu option to tesselate selected surfaces or brushes ([clip](https://www.youtube.com/watch?v=NHqJ133Cz8M))
* The menu options and button tooltips for undo/redo will now show you which actions they will undo/redo ([#1205](../../issues/1205), [clip](https://www.youtube.com/watch?v=VZ_6RONafX4))
* You can now adjust the code editor font size using CTRL+Mouse Wheel or by setting the CodeFontSize option in the [Options] section of UnrealEd.ini ([#1317](../../issues/1317), [clip](https://www.youtube.com/watch?v=FnMT7LnxBx8))
* You can now merge polygons, even if their respective surfaces do not have identical properties ([#1323](../../issues/1323), [clip 1](https://www.youtube.com/watch?v=FMIAwDrJ1H8), [clip 2](https://www.youtube.com/watch?v=QerHyJRQPco))
* Unreal Editor now resets the bNoDelete flag (to TRUE) for Movers when loading a level. This is necessary because Movers with bNoDelete set to FALSE break the moving brush tracker
* You can now select the "Uniform Shadows" option in the Unreal Editor build menu to make the editor build shadow maps whose scale is independent of their connected surface's scale ([#1435](../../issues/1435), [clip 1](https://www.youtube.com/watch?v=AH5OLNLZDPQ), [clip 2](https://www.youtube.com/watch?v=mrWEoXcZEAE))
* The path builder now builds faster, builds aerial paths ([#770](../../issues/770)), and has a new button option that rebuilds only the changed paths ([#1239](../../issues/1239), [clip](https://www.youtube.com/watch?v=QFsX3APCZf8))
* Unreal Editor now gives up if it fails to build a new path network within a reasonable amount of time/iterations ([#383](../../issues/383))
* Added a surface selection menu option that selects adjacent surfaces one by one ([clip](https://www.youtube.com/watch?v=vRry1Vx23VQ))
* You can now align textures while preserving their scale by holding the SHIFT key during alignment ([#676](../../issues/676))
* Added brush order options that can memorize the selected brush's position or that can move the selected brush before or after the memorized position ([#681](../../issues/681), [clip](https://www.youtube.com/watch?v=4AAu6RjAges))
* Integrated ScriptRays into the code editor so you can now decompile classes and view/edit the decompiled code ([#1444](../../issues/1444), [#1445](../../issues/1445), [clip](https://www.youtube.com/watch?v=GTyzd3iEypg))
* UCC make now prints a warning when it fails to resolve the target object of a default object property
* Added a build menu option to prevent the path builder from generating the (unused!) VisNoReach list. This can drastically reduce build times on maps with lots of path nodes ([#1473](../../issues/1473), [clip](https://www.youtube.com/watch?v=nYiKfJd1ZBQ))
* Unreal Editor can now play a beep sound after completing a slow action. By default, this message beep will play after completing an action that took more than 10 seconds. You can configure the duration threshold by setting/adding the "NotifyActionEndAfterSeconds" option in the [Options] section of UnrealEd.ini. Setting NotifyActionEndAfterSeconds to 0 will turn off the message beep ([#1490](../../issues/1490), [clip](https://www.youtube.com/watch?v=Us64sMd_-C4))
* Vastly improved build times for level geometry and lighting by optimizing and parallelizing the code ([clip](https://www.youtube.com/watch?v=Go8suVLl-lU))
* The surface copy feature will no longer copy the PF_SemiSolid, PF_NotSolid, PF_TwoSided, and PF_Portal flags ([#1487](../../issues/1487), [clip](https://www.youtube.com/watch?v=3E-k0Otjmhs))
* Added a "Show Texture Grid" option to the viewport->View menu. This option renders the map in a (white) boxed view ([#1407](../../issues/1407), [clip](https://www.youtube.com/watch?v=EGbKPrztrFM))
* You can no longer select hidden brushes using SHIFT+LMB ([#1533](../../issues/1533), [clip](https://www.youtube.com/watch?v=JQOp7-40Syw))
* Added a surface menu option that can select the brushes whose surfaces you've selected ([#1528](../../issues/1528))
* All browser windows should now refresh after executing an OBJ LOAD command ([#628](../../issues/628))
* Improved mipmap generation for images with low color depth ([#1408](../../issues/1408))
* Added group browser buttons that re-apply the visibility rules of the selected groups or all groups to actors in the groups ([#107](../../issues/107), [#285](../../issues/285), [#412](../../issues/412), [#413](../../issues/413))
* The texture import tool can now optionally use Bright to palletize P8 textures or ImageMagick to import textures stored in formats we do not natively support. To use these tools, install their respective binaries into the game's System folder, and check the "Use Bright" or "Use ImageMagick" boxes in the texture import dialog ([#1012](../../issues/1012))
* The sound browser now shows the bit depth, frequency, and number of channels in each sound sample
* The editor will now offer to tesselate non-coplanar polygons that would normally result in BSP errors ([clip](https://www.youtube.com/watch?v=MxI9GFub_EM))
* We added a 2D shape editor toolbar button that can tesselate the shape you're editing ([clip](https://www.youtube.com/watch?v=JGhfJYXSKMs))
* You can now edit vertices in the 2D and 3D viewports using SHIFT+LMB/RMB ([#1551](../../issues/1551))
* You can now scale vertices in the 2D viewports using CTRL+LMB+RMB ([clip](https://www.youtube.com/watch?v=OQnou7WLgCY))
* The brush exporter can now export non-triangulated brushes ([#1561](../../issues/1561))
* We added a new toolbar button that rebuilds the movers in your level ([clip](https://www.youtube.com/watch?v=nC187u3DLps))
* Added new menu options to toggle rendering of event lines ([#135](../../issues/135), [clip](https://www.youtube.com/watch?v=PR3MKT1O4vQ))
* The group browser should now refresh automatically after adding an actor to the level ([#172](../../issues/172))
* The vertices of selected brushes now render on top of all other brushes in vertex editing mode. This should make these vertices much easier to select ([#1037](../../issues/1037))
* Added a new toolbar button that shows all actors except those in hidden groups ([#1544](../../issues/1544))
* You can now undo the "Snap vertices to grid" operation ([#1565](../../issues/1565))
* You can now replace selected brushes with brushes of other classes ([#455](../../issues/455))
* Unreal Editor and UCC will now save files using a temporary file name if they cannot be saved with the desired file name
* ScriptRays can now decompile switch statements ([#1511](../../issues/1511))
* Added new standard viewport configuration with two viewports on one half of the screen and one viewport on the other half
* You can now use the CTRL+SHIFT+Z shortcut to redo a previously undone operation ([#1586](../../issues/1586))
* You can now use the N key to toggle rendering of paths in editor viewports
* You can now use the M key to toggle rendering of movers in editor viewports
* You can now toggle rendering of mover paths in editor viewports ([clip](https://www.youtube.com/watch?v=DdFyVtAO_-w))
* You can now open maps, textures, sounds, music, and UnrealScript files by dragging and dropping them into the main editor window ([clip](https://www.youtube.com/watch?v=Br1AqUzRhzU))
* Property windows now allow you to edit various additional properties of LOD meshes and skeletal meshes. Examples include the material flags, properties that control LOD morphing behavior (for LOD meshes), and animation properties for skeletal meshes
* You can now copy/paste surface properties ([#675](../../issues/675), [#931](../../issues/931), [clip](https://www.youtube.com/watch?v=rBtz2h9V7vo))
* Unreal Editor can now import dds textures saved by UT2004's editor ([#982](../../issues/982))
* The texture browser, mesh browser, and texture preview windows will no longer emit ambient sounds ([#1455](../../issues/1455), [clip](https://www.youtube.com/watch?v=VLrRBDdEIqQ))
* You can now enable rendering and selection of mover surfaces in 3D viewports ([#671](../../issues/671), [clip](https://www.youtube.com/watch?v=_QlEa19T9wU))
* You can now set the KeepRealtimePreviewOnPlay option in the [Options] section of UnrealEd.ini to keep the realtime preview viewport option enabled after launching a map from the editor ([#322](../../issues/322))
* You can now box-select vertices in 3D viewports using CTRL+ALT+LMB ([#1552](../../issues/1552), [clip](https://www.youtube.com/watch?v=ac6Jz_UVNUk))
* When ending a box selection in an editor viewport, the mouse cursor will now appear at the release position rather than the start position of the selection by default. You can restore the original behavior by setting the RestoreMouseCursorAtSelectionBoxEnd option to False in the [Options] section of UnrealEd.ini ([clip](https://www.youtube.com/watch?v=Spn5KMw0hyA))
* You can now select the "Apply Selected Actors to Level" option in the build menu to rebuild only the selected actors while keeping the rest of the level geometry intact ([clip](https://www.youtube.com/watch?v=Vs90vB-ALyE))
* The "Copy import properties" option in the Mesh Browser's Edit menu will now export the polyflags of all mesh materials and textures
* We implemented "Snake Alignment", a feature that allows you to align textures that span multiple surfaces. To use snake alignment, you should manually align the texture on one surface, then click that surface using SHIFT+CRTL+ALT+RMB, and finally click adjacent surfaces using SHIFT+CTRL+ALT+LMB ([#868](../../issues/868), [clip](https://www.youtube.com/watch?v=PZOgWRN8wgo)) 
* We implemented undo/redo for the 2D shape editor ([#1246](../../issues/1246), [clip](https://www.youtube.com/watch?v=GLZgcOGhEHo))
* We added a "Merge Shapes" menu option to the 2D shape editor. This option allows you to merge the selected shapes into one polygon ([#1550](../../issues/1550), [clip](https://www.youtube.com/watch?v=RMkby6g-aNI))
* We added a "Configure Context Menus" option to the editor View menu. This option allows you to choose which items appear in the actor, surface, and backdrop context menus [clip](https://www.youtube.com/watch?v=jAvLqcnZVXM))
* The Viewport View Menu now has an "Occlude Lines" option. When enabled, this option hides line segments that are occluded by level geometry ([#1451](../../issues/1451), [clip](https://www.youtube.com/watch?v=5Gl_nOaXc9g))
* The bottom bar will now show you the size of your selection box ([clip](https://www.youtube.com/watch?v=yNy1mdwi0Og))
* You can now add up to 20 custom "add actor" commands to the surface context menu by editing the ContextMenuClassAdd.Custom settings in UnrealEd.ini ([clip 1](https://www.youtube.com/watch?v=X4hbyVmZawA), [clip 2](https://www.youtube.com/watch?v=PAPhzc68ix8))
* We added a "Select All" option to the 2D shape editor ([clip](https://www.youtube.com/watch?v=MJhpkAuIexc))
* The Mover submenu in the actor context menu will now show you which key position the mover is in ([clip](https://www.youtube.com/watch?v=t8N9CrYjOpw))
* We added new options that allow you to reset a brush's origin without changing the brush's location ([clip 1](https://www.youtube.com/watch?v=nqaum_jfzAM), [clip 2](https://www.youtube.com/watch?v=UtaROdzff88))
* The backdrop context menu now contains new options for changing the grid size or for toggling "Snap to Grid" ([clip](https://www.youtube.com/watch?v=ygJEEjo1J6k))
* We added a new "Draw Shape" option to the 2D shape editor. This option allows you to draw any shape you like! ([clip](https://www.youtube.com/watch?v=yq7PqciLBaA))
* You should now be able to rename all classes, sound objects, music objects, and mesh objects from their respective browsers/editors ([clip](https://www.youtube.com/watch?v=QAgdiUhAC6E))
* You can now use the CTRL+A shortcut to select all text in text view windows (such as those that show exported properties) ([clip](https://www.youtube.com/watch?v=LOMQ24YckW0))
* We added new mesh browsers buttons and menu options to visualize the skeleton and bone names of skeletal meshes. These buttons also show you the bounding box and bounding sphere of all meshes
* We now reset the brush TempScale value when you finish scaling a brush with the "Snapped Brush Scaling" option
* The Windows XP version of Unreal Editor will no longer show you XP-incompatible renderers in the renderer selection menus
* D3DDrv now appears as "Direct3D7" in the renderer selection menus
* The editor will no longer warn you about broken movers or compatibility problems when it autosaves a map ([#1673](../../issues/1673))
* We added VulkanDrv to the editor viewport dropdown menu

#### UnrealScript

* The game will now report the last known location for actors that fell out of the world ([#1390](../../issues/1390), [clip](https://www.youtube.com/watch?v=5okG85wyKow))
* The game now resets and recalculates each actor's StandingCount when loading a map ([#1341](../../issues/1341))
* The game now resets the Level.TimeDilation value when loading a map ([#1373](../../issues/1373))
* The in-game preferences menu will now populate the video resolution list with common resolutions if the renderer fails to report supported resolutions ([#1452](../../issues/1452))
* UWindowURLTextAreas now support mailto and https links
* UWindowURLTextAreas and UWindowHTMLTextAreas now support mouse copy-pasting ([clip](https://www.youtube.com/watch?v=JlYD606M1iE))
* You can now modify the speed at which PlayerPawns move in state CheatFlying by editing the PlayerPawn.CheatFlyingSpeed property ([#1258](../../issues/1258))
* The game mode and game type filters in the in-game server browser are now case-insensitive ([#1437](../../issues/1437))
* UWindowWindow.SetAcceptsFocus() should now work as expected even if the Window's parent has changed since the previous call ([#897](../../issues/897))
* The map selection dialogs now support level screenshots with unexpected names ([#926](../../issues/926))
* The in-game server browser now shows you useful information such as the game speed, remaining time, elapsed time, and much more ([#439](../../issues/439))
* The default HUD will now render a solid chat area if you set the HUD opacity to the maximum value ([#640](../../issues/640), [clip](https://www.youtube.com/watch?v=JmdoHu74SH8))
* Added a new preferences menu option to adjust your Field of View (FOV) angle ([#1375](../../issues/1375))
* Added a new preferences menu dropdown box to switch between fullscreen, windowed, and borderless windowed (if available) mode ([#42](../../issues/42))
* UTrace now works for state code ([#1171](../../issues/1171))
* UTrace now causes much less CPU load than before ([clip](https://www.youtube.com/watch?v=ozVagr5immA))
* Added a "RUNAWAYCOUNTER" console command that returns the current value of the runaway counter ([#774](../../issues/774), [clip](https://www.youtube.com/watch?v=TpHZ8RzHczg))
* Added an UnrealScript profiler that outputs JSON-compatible profiling information in the game log. You can use the "UPROFILE" console command to to turn profiling on and off ([#865](../../issues/865), [clip](https://www.youtube.com/watch?v=LZlg_wPpiAU))
* Added a "UTRACE" console command that turn the UnrealScript tracer (originally added by UTPG) on and off ([#1527](../../issues/1527), [clip](https://www.youtube.com/watch?v=iqGA18PpGjg))
* Added a "BACKTRACE" console command that returns a dump of the current UnrealScript call stack ([#72](../../issues/72), [clip](https://www.youtube.com/watch?v=AEcr95CD3Oc))
* The game will now dump the UnrealScript call stack to the log file whenever it crashes with an infinite script recursion error ([#1474](../../issues/1474))
* You can now use the "SPEC" or "PLAY" console commands to reconnect to the server as a spectator or player respectively. In addition, you can use the "RED", "BLUE", "GREEN", or "GOLD" console commands to change to the respective teams ([#1043](../../issues/1043), [clip](https://www.youtube.com/watch?v=bYaBsn2XDn4))
* "SET" console commands now produce a feedback message that includes the full name of the modified property and its updated value ([#755](../../issues/755))
* Increased the width of the text boxes in the advanced video settings menu ([#1585](../../issues/1585))
* The "Voice Messages" option in the in-game audio settings menu will now be visible even if you are not spectating a game ([#1590](../../issues/1590))
* Improved performance of all mods and menus that enumerated or iterated over all installed skins ([#1598](../../issues/1598))
* We added various new key binding options to the in-game controls menu ([#1611](../../issues/1611), [#1613](../../issues/1613))
* We optimized the code that populates the server list in the in-game server browser. As a result, servers should now appear almost immediately
* The control preferences now allows you to bind keys to show the scoreboard or server info
* The server browser will now remember and restore the heights of its sub-windows ([#1362](../../issues/1362))
* The "RELOADCONFIG" command will now reload the configuration of all instances of the specified class
* The FOV textbox in the in-game video settings menu now supports floating-point values ([#1704](../../issues/1704))

#### Physics and Player Movement

* You can now enable the moving brush tracker on servers by setting the Engine.GameEngine.UseNetMovingBrushTracker option to true. By enabling the moving brush tracker, AI-controlled actors such as Bots, Monsters, and ScriptedPawns, will no longer ignore movers ([#559](../../issues/559), [clip](https://www.youtube.com/watch?v=8jSB5tZlf8E))
* We backported Marco's octree collision code (originally written for Unreal 227) to UT. This code detects collisions more accurately and with a dramatically lower computational cost, resulting in reduced load on servers that run custom mods such as XVehicles. The octree collision code is enabled by default but can be disabled by setting the Engine.GameEngine.UseOctreeCollisionHash option to false ([#582](../../issues/582), [#371](../../issues/371), [clip 1](https://www.youtube.com/watch?v=vjftKYAcvk0), [clip 2](https://www.youtube.com/watch?v=6ExOWSoKiWY))

#### Audio and 3D Rendering

* The game can now apply widescreen-friendly Hor+ Field of View (FOV) scaling while maintaining the correct weapon and muzzle flash positioning (External Contribution by Masterkent) ([#111](../../issues/111), [clip](https://www.youtube.com/watch?v=F5cUR_sNWVo))
* You can now enable and disable vertical synchronization when playing with the OpenGLDrv renderer on a Linux/ARM platform
* Light actors that use the LT_Flicker LightType will now update approximately 30 times per second ([#1216](../../issues/1216))
* We added a "TRYRENDERDEVICE" console command that allows you to switch to a different renderer without restarting the game ([#1319](../../issues/1319), [clip](https://www.youtube.com/watch?v=OAL933bs35Y))
* We added a shader-based gamma correction mode to D3D9Drv. This new mode can reliably apply gamma correction to the game, even when it is running in windowed mode. You can enable shader-based gamma correction by changing the UseShaderGamma option in the [D3D9Drv.D3D9RenderDevice] section of the game ini. If set to 0, D3D9Drv will use its old (and extremely unreliable) gamma correction method. If set to 1, D3D9Drv will use the new method in windowed mode and the old method in fullscreen mode. If set to 2, D3D9Drv will always use the new method ([#491](../../issues/491))

#### Input and Windowing

* The editor/game log window can now be minimized and maximized
* The game will now automatically switch to windowed mode when you launch the actor editor ([#1296](../../issues/1296))
* The game will now remove the window borders when you use windowed mode with a resolution equal to or larger than the screen resolution ([#1364](../../issues/1364))
* The Linux and macOS clients will now use SDL2's fullscreen desktop window option when they open a fullscreen window with the same resolution as your desktop. As a result, you should now be able to use Cmd+Tab and media hotkeys on Mac systems
* The Windows client now supports borderless game windows. You can switch to a borderless window either using the in-game menu, by setting WinDrv.WindowsClient.StartupBorderless to TRUE, or by executing the "SETSCREENMODE BORDERLESS" console command 
* The editactor console command can now be run from the log window ([clip](https://www.youtube.com/watch?v=AvIPXvREiGo))

#### Miscellaneous

* The game will now log a more descriptive error when it tries to load a package without a valid header ([#1389](../../issues/1389))
* We now use Microsoft's mimalloc memory allocator. This gives us a nice performance boosts in the game client, server, and editor on all platforms
* The game will now show you a more descriptive error message when you try to launch it from a game folder that does not contain the required game data ([#1248](../../issues/1248))
* The game will now decompress the entry map on-the-fly if it finds Entry.unr.uz but cannot find Entry.unr. This change will allow players who skip the map decompression step of the game installation to play the game ([#497](../../issues/497), [#1339](../../issues/1339), [#1505](../../issues/1505), [#1665](../../issues/1665))
* The Windows executables will now log additional debugging information into the log file when the game/server/editor crashes
* Cache purging is now disabled by default ([#1706](../../issues/1706))

## Unreal Tournament Version 469d Release Notes

Version 469d is completely network compatible with all previous public releases of UT (down to 432).
The UTPG and OldUnreal teams worked hard to maintain binary compatibility with older native mods.
Most of these mods will continue to work in version 469d. However, some mods may need some trivial updates.
If you are a native mod author, and you are having trouble updating your mod for version 469d, then please reach out to us at [the OldUnreal forums](https://www.oldunreal.com/phpBB3/viewforum.php?f=37).
**Note:** This patch disables older versions of ACE.
Server admins should upgrade ACE to version 1.1e or later to check 469d clients.

### Patch Highlights

* This patch includes several performance fixes and improvements for clients and servers
* This patch adds support for Linux-aarch64/ARMv8 platforms. This means you can now host servers (or even play the game) on your Raspberry Pi 3/4! ([#1013](../../issues/1013), [Patreon Post](https://www.patreon.com/posts/83522201))
* Good news for movement-centric game types such as BunnyTrack: This patch fixes several long-standing movement and networking issues! (e.g., [#782](../../issues/782), [#805](../../issues/805), [#228](../../issues/228))
* We've dealt a real blow to the Editor goblin. 469d has tons of editor bug fixes, improvements, and new tools
* The 469d client should now automatically connect to the community master servers, regardless of how you installed it. If your server browser is still empty after installing the patch, then simply go to Options>Preferences>Network in the game menu and click the "Update/Fix Network Settings" button to restore your game's online functionality

### Patch Distribution

* Updated 3rd party dependencies:
- OpenAL-Soft version 1.22.2
- flac version 1.4.2
- SDL version 2.26.2
- mpg123 version 1.31.2

### Stability Improvements

#### Game Client

* Fixed a bug that could crash the macOS game client upon startup ([#945](../../issues/945))
* Fixed a bug that could crash the macOS game client when a mod tried to access the Engine.Actor.Touching array. This bug made it impossible to play Nali Weapons III on macOS ([#1154](../../issues/1154))

#### UnrealScript

* Fixed a bug that could make the game crash if an actor set a latent action and performed a state change within the same expression 
* Fixed a bug that could make the game freeze after pressing the jump key while spectating on maps such as AS-HiSpeed ([#732](../../issues/732), External Contribution by Buggie)
* Fixed a bug that could make the game crash if a SkaarjBerserker tried to attack a friendly player ([#1066](../../issues/1066), External Contribution by Buggie)
* Fixed a bug that could make the game crash when calling UPlayer::Destroy during garbage collection ([#1398](../../issues/1398))

#### Unreal Editor

* Fixed a bug that could make the editor crash while creating fonts with the TrueTypeFontFactory ([#1368](../../issues/1368))
* Fixed a bug that made the editor crash when attempting to export a compressed texture without P8 data ([#1396](../../issues/1396))
* Fixed a bug that made the editor crash when unaligning a surface after deleting its brush ([#1254](../../issues/1254))

#### Audio and 3D Rendering

* Fixed bugs that could crash D3D9Drv when importing non-power-of-two textures ([#1003](../../issues/1003), External Contribution by Buggie)
* Fixed a minor rendering glitch that triggered when using D3D9Drv in a window whose width had an uneven number of pixels ([#1019](../../issues/1019), External Contribution by Buggie)

### Bug Fixes

#### Physics and Player Movement

* Fixed a bug that could cause the camera to rotate rapidly when jumping on a kicker ([#782](../../issues/782))
* Fixed a bug that could make actors trigger spurious Touch/UnTouch events just before colliding with each other. As a side effect of this bug, some kickers applied too momentum to the players they kicked ([#228](../../issues/228))

#### Networking and Netcode

* Fixed a bug that broke decompression of certain compressed files downloaded from redirect servers ([#656](../../issues/656))
* Fixed a bug that broke client-side physics simulation of certain projectiles and items ([#1196](../../issues/1196))

#### Input and Windowing

* Fixed a bug that made Windows ignore certain mouse clicks when the game was running in the background and raw mouse input was enabled
* Fixed a bug that made it impossible to clear property values through the properties browser (External Contribution by Buggie)

#### Unreal Editor

* The "None" group should now be visible in the sound browser ([#908](../../issues/908), External Contribution by Buggie)
* Fixed a bug that made the 2D editor produce invalid cylinders ([#991](../../issues/991), External Contribution by Buggie)
* Fixed a bug that made the 2D editor incorrectly render the grid after zooming ([#994](../../issues/994), External Contribution by Buggie)
* Fixed a bug that made the code editor scroll to the wrong line after the compiler reported an error (External Contribution by Buggie)
* Fixed several bugs that made it impossible to use classes/objects with spaces, brackets, or parentheses in their names ([#1124](../../issues/1124), [#1072](../../issues/1072), [#930](../../issues/930))
* Fixed a bug that could break the "Play Map" button under certain circumstances (External Contribution by Buggie)
* Fixed a bug that made it impossible to select certain movers
* Fixed a bug that sometimes made the pivot silently snap to the grid ([#458](../../issues/458))
* Fixed bugs that caused erratic in-game input behavior after launching the game through the editor "Play Map" button ([#1204](../../issues/1204), [#1203](../../issues/1203), [#1202](../../issues/1202))
* Fixed a bug that forced the game log window to the background after launching the game through the editor "Play Map" button ([#447](../../issues/447))
* Fixed a misleading error message that appeared when compiling a class with a struct declared in a local function scope ([#1403](../../issues/1403))
* Fixed a bug that sometimes made it impossible to import sounds and music into the "None" group ([#1345](../../issues/1345))
* Fixed a bug that made the editor calculate incorrect iWarpZone values for portals with unexpected iZonePortalSurf values ([#521](../../issues/521))

#### UnrealScript

* Fixed a bug that made it impossible to import static array members in defaultproperties
* Fixed a bug that made certain dynamic array expressions access the wrong array element
* Fixed a bug that could make the secondary enforcer produce sounds from the wrong location ([#277](../../issues/277))
* Fixed a bug that allowed TeamCannons to shoot through thin walls ([#614](../../issues/614), External Contribution by Buggie)
* Fixed various accessed none errors ([#314](../../issues/314), [#1153](../../issues/1153), [#1053](../../issues/1053), [#1050](../../issues/1050), [#892](../../issues/893), External Contribution by Buggie)
* UTFadeTextArea controls now correctly calculate their scroll limits ([#901](../../issues/901), External Contribution by Buggie)
* Fixed a bug that could prevent Mercenary pawns from dying even when their health dropped below 0 ([#551](../../issues/551), External Contribution by Buggie)
* Fixed a bug that made certain fonts on the team scoreboard not scale with the game resolution ([#960](../../issues/960), External Contribution by Buggie)
* Fixed a bug that made "timedemo 1" report an incorrect frame rate if the entry level had a non-standard time dilation set ([#1033](../../issues/1033), External Contribution by Buggie)
* Fixed a bug that made (nearly) all default game types ignore the ?timelimit URL parameter (External Contribution by Deaod)
* Fixed a bug that made the dodge timer reset duration dependent on player ping ([#805](../../issues/805), External Contribution by Deaod)
* The UnrealShare.ScriptedPawn.AttitudeTo bug fix for TeamGamePlus games is now disabled by default because some mods relied on 436's (incorrect) behavior. You can manually re-enable this fix by setting the bTeamGamePlusFix config variable to true for each pawn type that handles TeamGamePlus games correctly ([#1183](../../issues/1183))
* We partially reverted UTPG's illegal skin check. Bots should now, once again, be able to use skins from all ServerPackages ([#1179](../../issues/1179), [#56](../../issues/56))
* Fixed a bug that could cause lag spikes on servers when a client requested the server's mutator list ([#1218](../../issues/1218))
* Fixed a bug that made the exec console command incorrectly parse its arguments ([#1279](../../issues/1279))
* The AddToPackageMap and IsInPackageMap should now work as expected
* Fixed a bug that made certain crosshairs render incorrectly when disabling 469's crosshair translucency setting ([#1405](../../issues/1405))

#### Audio and 3D Rendering

* Fixed a bug that could give the game window incorrect dimensions after changing the game resolution on a macOS system
* Fixed a bug that made it impossible for certain renderers (such as OpenGLDrv) to acquire an exclusive fullscreen window. As a side effect of this bug fix, (mouse) input latency should now be noticeably lower when using these renderers ([#795](../../issues/795))
* Fixed a bug that made ALAudio restart the currently playing music track after pasting or duplicating an actor (External Contribution by Buggie) ([#1325](../../issues/1325))
* Fixed a bug that caused choppy music playback in ALAudio after CPU load spikes (External Contribution by Buggie) ([#1330](../../issues/1330))
* Fixed a bug that made ALAudio loop OGG music tracks too early (External Contribution by Buggie) ([#1332](../../issues/1332))
* Fixed a bug that made ALAudio corrupt OGG sounds and music tracks in packages saved using UnrealEd (External Contribution by Buggie) ([#1344](../../issues/1344))
* Fixed a bug that caused inaccurate playback of ambient sounds when playing with ALAudio and HRTF enabled (External Contribution by Buggie) ([#1338](../../issues/1338))

#### Miscellaneous

* Fixed a bug that broke logging of certain fatal errors in the game/server log file on Linux and macOS
* Fixed a bug that broke game relaunching from the video options menu if your game executable was not called UnrealTournament.exe
* Fixed a bug that could make CTRL+V paste garbled text from the Windows clipboard
* Fixed a bug that made it impossible to load savegames if the saved map had lazy-loaded sounds, music, or meshes ([#1275](../../issues/1275))

### Enhancements

#### Input and Windowing

* Rewrote the mouse input handling code and made raw mouse input work in Unreal Editor. Enabling raw input in Unreal Editor should drastically improve the mapping experience for users with high-DPI mice ([#1026](../../issues/1026))
* Made the window manager remember and restore the maximized state of all game and editor windows ([#571](../../issues/571), External Contribution by Buggie)
* Added support for keyboard navigation in wizard windows such as those used in the Setup utility ([#870](../../issues/870), External Contribution by Buggie)
* Made text entered in terminal windows (such as the Unreal Editor log window) editable ([#873](../../issues/873), External Contribution by Buggie)
* Made it possible to toggle individual polyflags in the actor properties window ([#691](../../issues/691), External Contribution by Buggie)

#### Unreal Editor

* Made Unreal Editor always render the builder brush even if it has bHiddenEd set to true ([#102](../../issues/102))
* Made Unreal Editor update the properties windows after performing a MAP SELECT operations
* Made Unreal Editor ignore hidden brushes in MAP SELECT operations
* Added a new actor browser tool that allows you to save MyLevel content as a separate package (External Contribution by Buggie)
* Added a new actor browser tool that allows you to merge a package's contents into another package (External Contribution by Buggie)
* Added a new actor browser tool that allows you to load all of a package's classes ([#878](../../issues/878), External Contribution by Buggie)
* Added a new viewport context menu option that allows you to move the builder brush to the location of the last mouse click (External Contribution by Buggie)
* Added a new viewport context menu option that allows you to paste an instance of the selected actor at the location of the last mouse click (External Contribution by Buggie)
* Made it possible to enter texture panning and skew values on the alignment tab of the surface properties window. The window supports literal values or simple mathematical formulas (External Contribution by Buggie)
* Unreal Editor viewports can now be maximized and minimized by double clicking on their toolbar ([#562](../../issues/562), External Contribution by Buggie)
* Added button tooltips in the group browser (External Contribution by Buggie)
* Added support for common hotkeys in various Unreal Editor windows and dialogs ([#877](../../issues/877), External Contribution by Buggie)
* Added a bottom bar button to enable/disable in-editor sound ([#504](../../issues/504), External Contribution by Buggie)
* The actor browser now automatically expands relevant superclasses after you create a new subclass (External Contribution by Buggie)
* Added a new "match whole word" search option to the search actors dialog ([#905](../../issues/905), External Contribution by Buggie)
* Added a new editor tool that allows you to scale selected actors ([#806](../../issues/806), External Contribution by Buggie)
* Added a new editor tool ("Array") that allows you to create duplicates of the selected actor with configurable location, rotation, or scaling offsets added to each subsequent duplicate ([#809](../../issues/809), External Contribution by Buggie)
* Added a new editor tool that allows you to randomly rotate all selected actors ([#810](../../issues/810), External Contribution by Buggie)
* Added several new options to the 2D cylinder shape editor ([#992](../../issues/992), [#1047](../../issues/1047), [#1136](../../issues/1136), [#1137](../../issues/1137) External Contribution by Buggie)
* Made it possible to export the code of selected actors in the actor browser ([#707](../../issues/707), External Contribution by Buggie)
* Added dropdown lists that allow you to select the package you want to import a new actor/music/sound/texture into (External Contribution by Buggie)
* Added a new actor browser tool that allows you to save the configuration file for the selected class ([#1017](../../issues/1017), External Contribution by Buggie)
* Added a new actor browser tool that allows you to dump a .int file for the selected package (External Contribution by Buggie)
* Made Unreal Editor save the state of the buttons in the bottom bar (External Contribution by Buggie)
* If the code editor reports an error, you can now double-click the bottom bar to scroll directly to the error location (External Contribution by Buggie)
* Added a new viewport configuration preset with two side-by-side viewports (External Contribution by Buggie)
* The titles of minimized editor windows should now be readable for mappers using modern versions of Windows (External Contribution by Buggie)
* Minimized editor windows will now be positioned on the right-hand side of the screen (External Contribution by Buggie)
* You can now declare up to 30 user-defined button groups in Unreal Editor ([#1147](../../issues/1147), External Contribution by Buggie)
* Various editor windows and tools now display errors using error balloons rather than modal dialogs (External Contribution by Buggie)
* Implemented several new texture alignment options for Unreal Editor:
```
- Wall for Cylinder: wraps a texture around the vertical surfaces of a cylinder brush. Respects the scale of already used on the selected surfaces
- One Tile: Fills a surface with a single tile, scaling the texture's width and height independently
- One Tile U: Fills a surface with a single tile, but only scales the width of the tile's texture to match the width of the surface. Will apply the same scale to the height of the texture
- One Tile V: Fills a surface with a single tile, but only scales the height of the tile's texture to match the height of the surface. Will apply the same scale to the width of the texture
```
(External Contribution by Buggie)
* Added "In Use", "All Textures", and "Most Recently Used" tabs to the texture browser ([#966](../../issues/966), External Contribution by Buggie)
* Added the Actor.PrePivot property to the Display category in the actor properties window ([#1182](../../issues/1182), External Contribution by Buggie)
* Made the code editor export default object and class properties with their shortest possible unambiguous name ([#778](../../issues/778))
* Added support for importing PNG grayscale images
* Unreal Editor no longer attempts to test editor support for certain outdated renderers (such as GlideDrv)
* The UCC make commandlet now allows you to specify which extra packages you want to build by adding the -packages=package1:...:packageN command line parameter. Make parses this parameter and builds the entire list of extra packages after building the EditPackages
* Most UCC commandlets will now recognize the "--" command line delimiter. This delimiter allows you to separate commandlet-specific parameters from global UCC parameters
* D3D9Drv and OpenGLDrv now allow you to configure the color for selected surfaces in Unreal Editor ([#823](../../issues/823))
* Unreal Editor no longer adds a leading space to the command line parameters it passes to the game if said parameters start with a '?' character. This means you should now be able to set Editor.EditorEngine.GameCommandLine to, for example, "?Game=Botpack.CTFGame?Mutator=Botpack.InstaGibDM -log" ([#529](../../issues/529))
* The editor now gives you line information when warning about an unreferenced local variable during UnrealScript compilation ([#355](../../issues/355))

#### UnrealScript

* UnrealScript classes can now import other classes using a new "imports" directive. For example:
```
class MyClass extends Object imports(SomeOtherClass);
```
This new directive makes static functions, struct definitions, and enums declared in the imported class available in the importing class.
* The UnrealScript compiler now creates the Inc folder when exporting native class definitions
* UnrealScript structs can now be marked as native. This allows the compiler to export the definitions of these structs to C++ headers
* Made the in-game server browser maintain its sorting options after refreshing or selecting a new server (External Contribution by Buggie)
* Increased the number of ListFactories in UBrowserServerListWindow to 20 (External Contribution by Buggie)
* Added text editing support for the in-game quick console (External Contribution by Buggie)
* Increased the number of stored server passwords from 10 to 50 ([#893](../../issues/893), External Contribution by Buggie)
* Made the mutator list in the in-game server browser easier to read ([#894](../../issues/894), External Contribution by Buggie)
* You can now press the F4 button in the in-game server browser to re-ping all servers ([#896](../../issues/896), External Contribution by Buggie)
* Made UTFadeTextAreas speed up their rendering animation if the mouse cursor hovers above them (External Contribution by Buggie)
* Implemented a "ReloadConfig &lt;x&gt;" console command that allows you to reload the configuration file of the specified object or class. If you do not specify any object or class, reloadconfig will reload the configuration of all known objects and classes ([#480](../../issues/480))
* Added a new advanced renderer properties window to the in-game menu
* Changed the default value of Botpack.CTFGame.bAutoRespawnFlags to false because the true setting broke BunnyTrack ([#279](../../issues/279))
* Made the in-game browser connect to OldUnreal's new UpdateServer. This server hosts a message of the day page and a masterserver list. Your client will automatically download this list and update its masterserver settings if you have bKeepMasterserver set to false in the [UBrowser.UBrowserMainClientWindow] of your game ini
* The in-game browser now supports clicking on https links
* If a function call gets absorbed, the UnrealScript VM will now return a default-initialized return value for the called function ([#1226](../../issues/1226))
* Added a "Fix/Update Network Settings" button to the in-game menu. This button will update your client's outdated masterserver settings and restore the server browser's functionality (External Contribution by Buggie)
* UWindowList now uses merge sort to sort lists. This speeds up sorting of large lists and fixes runaway loop crashes (External Contribution by Buggie)
* The player mesh in the player setup window should now rotate at a frame rate-independent speed (External Contribution by Buggie) ([#1393](../../issues/1393))

#### Audio and 3D Rendering

* Added support for various new audio formats (many of which were already supported by Galaxy and Cluster) in ALAudio ([#324](../../issues/324))
* The game should now be able to enforce high frame rate caps on Windows ([#176](../../issues/176))
* Galaxy's audio output should now more closely match UT version 436, as it now plays certain sounds at 4 times the intended volume ([#505](../../issues/505))

#### Networking and Netcode

* The UZ compression and decompression code is now multithreaded. This should substantially increase (de)compression speed on clients and in UCC ([#935](../../issues/935), External Contribution by Buggie)
* The game will now try to reload packages when you're connecting to a server that runs a different version of a package that is already loaded. This should result in far fewer failed connections due to "Package Version Mismatches" ([#1251](../../issues/1251))
* The game will now display the total download progress when downloading packages from a game server ([#443](../../issues/443))

#### Localization

* Added Greek localization (External [Contribution](https://github.com/OldUnreal/unreal-localization/commit/92d9160399944fd79c736a4eac33efdd0cc3bbff) by LDinos)

#### Miscellaneous

* The macOS application bundle now contains a fully-featured version of UCC

## Unreal Tournament Version 469c Release Notes

Version 469c is completely network compatible with all previous public releases of UT (down to 432).
The UTPG and OldUnreal teams worked hard to maintain binary compatibility with older native mods.
Most of these mods will continue to work in version 469c. However, some mods may need some trivial updates.
If you are a native mod author, and you are having trouble updating your mod for version 469c, then please reach out to us at [the OldUnreal forums](https://www.oldunreal.com/phpBB3/viewforum.php?f=37).
**Note:** This patch disables older versions of ACE.
Server admins should upgrade ACE to version 1.1e or later to check 469c clients.

### Patch Distribution
* Updated the included FMOD Engine binaries for all clients to version 2.02.10
* The Windows installer is now digitally signed
* Removed libcurl from the patch. Server admins that use the MD5 anti-cheat protection feature and that have automatic updates enabled for the package list will have to manually download libcurl or use the version that came with the previous patch. This change should substantially reduce the number of false positive malware warnings triggered by our patch
* Added native support for Linux/AMD64 and macOS/Apple Silicon platforms
* Included an updated version of the UT PubSrc SDK

### Stability Improvements

#### Unreal Editor

* Fixed a bug that caused Unreal Editor to crash when using the texture exporter without having a texture selected (External Contribution by Buggie)
* Fixed a bug that caused Unreal Editor to crash when clicking the "Add Class Here" option without having a class selected (External Contribution by Buggie)
* Fixed a bug that caused Unreal Editor to crash when attempting to export source-stripped classes
* Fixed a bug that could make our map compatibility checks crash Unreal Editor while saving maps

#### Game Client

* Fixed a bug that caused random crashes and freezes when calling GotoState/GotoLabel while processing a function call from state code
* Fixed a bug that could cause the garbage collector code to crash while cleaning up decals
* Fixed a bug that caused the game log window to freeze when printing large amounts of data (External Contribution by Buggie)
* Fixed a bug that caused the game to crash when parsing wave files without sample chunks
* Fixed a bug that could make the game crash when binding to native functions whose name clashed with names used in the map

#### UnrealScript

* Made the UnrealScript VM clean up and restore the mutator chains after destroying a mutator with broken cleanup code
* Fixed a bug that could cause a crash in the CHSpectator class when cycling through players as a spectator (External Contribution by Buggie)
* Fixed a bug that could cause the game to freeze when a Bot gets stuck in state 'FallingState' (External Contribution by Buggie)
* Fixed a bug that could make the web admin freeze the server when processing an invalid uhtm file

#### Audio and 3D Rendering

* Fixed a bug that made some of the renderers crash when attempting to load/render compressed textures generated by Unreal 227's editor
* Fixed a bug that made the game crash when attempting to render a LODMesh with DrawScale set to 0
* Fixed a bug that made ALAudio crash when playing a level with an invalid song (External Contribution by Buggie)

#### Physics and Player Movement

* Fixed an overflow bug that caused the game to freeze when traversing path nodes with a very high cost

### Bug Fixes

#### Unreal Editor

* Fixed a bug that enabled the game audio after using the Replace Textures tool (External Contribution by Buggie)
* Fixed a bug that caused the group editor lock button not to work for certain actors (External Contribution by Buggie)
* Fixed a bug that made Unreal Editor ignore the "only rebuild visible actors" button in the build options menu (External Contribution by Buggie)
* Fixed a bug that caused the actor properties menu not to update when selecting or unselecting actors in the group browser (External Contribution by Buggie)
* Fixed a bug that made Unreal Editor sometimes show the wrong line number after a failed compilation (External Contribution by Buggie)
* Fixed several bugs that made Unreal Editor not update the package list correctly (External Contribution by Buggie)
* Fixed a bug that caused the "Or With Memory" option in the Surface menu not to work (External Contribution by Buggie)
* Fixed a bug that caused the game preferences and UnrealEd's actor properties menus to swap the R and B color channels for color properties
* Fixed a bug that caused the "Find Previous" dialog in the Code Editor to search for the wrong strings (External Contribution by Buggie)
* Fixed a bug that caused viewports to remain maximized and impossible to interact with after maximizing them in a previous UnrealEd session (External Contribution by Buggie)
* Fixed a bug that caused viewports to reset when minimizing the main editor window (External Contribution by Buggie)
* Fixed a bug that caused UnrealEd to ignore certain command line parameters (e.g., LOG and ABSLOG)
* Fixed a bug that made UnrealEd export/import string properties without properly escaping/unescaping special characters
* Fixed a bug that caused incorrect line breaks in the code editor window (External Contribution by Buggie)
* Fixed a bug that made UnrealEd attempt to recompile source-stripped classes
* Fixed a bug that made the bottom elements in the actor properties dialog appear multiple times (External Contribution by Buggie)
* Fixed bugs that made UnrealEd incorrectly import certain images with alpha channels
* Fixed a bug that made it impossible to import or use sounds/music tracks with special characters in their file/package/group names
* Fixed a bug that made it impossible to edit certain array properties through the preferences menu
* Fixed a bug that made UnrealEd discard the alpha channel while importing BC7-compressed textures
* Fixed a bug that made UnrealEd duplicate actors when undoing an actor paste operation

#### Game Client

* Fixed a bug that caused the mouse scroll wheel not to work in the preferences menu
* Fixed a bug that caused mouse buttons 4 and 5 not to work correctly with cursor input
* Fixed a bug that made it impossible to reload games that were saved while the in-game font scale was set to a very high value
* Fixed a bug that made it impossible to enter network servers after having hosted a listen server
* Fixed a bug that made the Linux and macOS game clients save ini files incorrectly under certain circumstances

#### UnrealScript

* Fixed a bug that caused voice menu glitches when using big voice packs (External Contribution by Buggie)
* Fixed a bug that caused the voice menu to scale incorrectly when you had the "override GUI scaling" option enabled (External Contribution by Buggie)
* Fixed a bug that caused the start game menu to scale incorrectly when you had the "override GUI scaling" option enabled (External Contribution by Buggie)
* Fixed a bug that caused the game server not to advertise the bot difficulty level correctly (External Contribution by Buggie)
* Fixed a bug that made it impossible to add a specific bot to a game if you had previously kicked that bot from the game (External Contribution by Buggie)
* Fixed various accessed none errors
* Fixed a bug that broke Brock and Xan's taunt animations in the CityIntro map
* Fixed missing models for Skaarj Hybrid characters in the trophy room map (External Contribution by Buggie)
* Fixed a bug that caused the sniperrifle to keep zooming when firing while holding down the altfire button (External Contribution by Buggie)
* Fixed a bug that could cause the warheadlauncher to fire and consume ammo without actually spawning a projectile
* Fixed a bug that caused the HUD to render certain numbers above 1000 incorrectly (External Contribution by Buggie)
* Fixed a bug that allowed the pulse gun to fire through walls in certain cases (External Contribution by Buggie)
* Fixed a bug that made flag captures not register immediately if you picked up an enemy flag while standing on your own flag base. This fix is enabled by default, but can be disabled by setting the bFixFlagBasePickup option for your CTFGame type to false.
* Fixed a bug that inadvertently made Nali Warcows and Skaarj Hybrid skins visible while their respective owners were in the PlayerWaiting state (External Contribution by Buggie)
* Fixed a bug that caused certain weapons to continue firing while the player holding them was feigning death (External Contribution by Buggie)
* Fixed a bug that caused the sniper rifle zoom to persist through feign death. This fix is enabled by default but can be disabled by setting the bFixFeignDeathZoomBug option of your GameInfo class to false (External Contribution by Buggie)
* Fixed a bug that allowed players to hold and fire multiple weapons simultaneously while/after feigning death. This fix is enabled by default but can be disabled by setting the bFixMultiWeaponBug option of your GameInfo class to false (External Contribution by Buggie)
* Fixed a bug that forced UTStats users to turn both bLocalLog and bWorldLog off
* Fixed a bug that caused horizontal sliders to behave erratically after selecting a negative value (External Contribution by Deaod)
* Fixed a bug that broke the free rotating camera in Onslaught mode after disabling mouse smoothing (External Contribution by Buggie)
* Fixed a bug that caused ObjectPaths to move base actors without moving the actors standing on them (External Contribution by Buggie)
* Fixed a bug that caused the menu to break when pressing the escape key while the speech menu is open
* Fixed a bug that made it impossible to call ArrayCount on Engine.Actor.Touching
* Fixed a bug that made the game balance teams incorrectly when a player had just left (External Contribution by Buggie)
* Fixed a bug that caused the weapon to obstruct your view when spectating certain players in first-person view (External Contribution by Buggie)
* Fixed rounding errors in Core.Object.Normal and Core.Object.MirrorVectorByNormal
* Fixed a bug that could cause make stationary pawns such as TeamCannons freeze the game if their target died while they were following it
* Fixed a bug that could cause CTFFlags to vanish if they were last held by a Bot that recently died (External Contribution by Buggie)
* Fixed a bug that made unacquired trophies appear in the trophy room (External Contribution by Buggie)
* Fixed a bug that made it impossible to start games with categories other than "Unreal Tournament" (External Contribution by Buggie)
* Fixed a bug that made holes appear in the strength and regeneration relics

#### Physics and Player Movement

* Fixed a bug that made kickers move swimming or flying players into PHYS_Falling
* Fixed a bug that caused players to collide with invisible level geometry when using a walk+jump bind to jump off a ledge. This is a client-side fix that should work on all v469 servers
* Fixed a bug that made players that were feigning death rotate as they moved their mouse
* Fixed a bug that made players get stuck in CheatFlying state when switching from ghost/fly to walk
* Fixed a bug that caused the game to retain mispredicted locations for enemy players. This bug could cause some jittering at high frame rates and it could cause the game to render enemy players in the wrong location. (External Contribution by Deaod)
* Fixed a bug that made jump height and distance dependent on tick/frame rate

#### Audio and 3D Rendering

* Fixed flickering gouraud polygons in XOpenGLDrv
* Fixed a bug that caused mesh lighting to change too suddenly at high frame rates
* Fixed a bug that caused ALAudio to spam the log file and to play certain sounds from the wrong location
* Fixed a bug that caused Cluster to start tracker song playback from the wrong section/order in certain songs
* Fixed a bug that caused ALAudio to stop playing looping sounds played through ClientPlaySound if you moved too far away from the origin of the map
* Fixed a bug that made Galaxy play a whistling sound when a player or bot died while holding a pulse gun
* Fixed an XOpenGLDrv problem that made certain weapons render on top of the HUD
* Fixed a bug that made the chat beep sound mute other sounds
* Fixed XOpenGLDrv bindless texture support for Intel GPUs

#### Networking and Netcode

* Fixed a bug that made the properties of Botpack.Kicker objects replicate incorrectly to older clients

#### Miscellaneous

* Fixed a bug that made the Linux/macOS clients not read UTF-16LE encoded files correctly
* Fixed a bug that could make Setup's UMOD installer erase ini settings such as the ServerPackages (External Contribution by Buggie)
* Fixed a bug that broke UCC's unicode output in the Windows console
* Fixed a bug that caused UCC not to display certain errors

### Enhancements

#### Unreal Editor

* If Unreal Editor tries to check a renderer for compatibility and that renderer crashes the editor, it will not be checked for compatibility again next time you launch UnrealEd
* When attempting to open a window that is already open, UnrealEd now brings that window to the top of the window stack
* Improved the performance of the UZ compress/decompress commandlets (External Contribution by Buggie)
* Added a new texture browser menu option that culls unused textures (External Contribution by Buggie)
* Added a new select surface menu option that selects all surfaces in the same zone as the selected surface (External Contribution by Buggie)
* Made the command bar remember the most recently used commands even after restarting the editor (External Contribution by Buggie)
* Made the code editor remember the most recent searches even after restarting the editor (External Contribution by Buggie)
* Added a texture lock button to the bottom bar. This button allows you to freeze texture properties such as UPan and VPan while vertex editing (External Contribution by Buggie)
* Improved the performance of the map builder (External Contribution by Buggie)
* Added substring searching support to the actor search window (External Contribution by Buggie)
* Improved group browser icons (External Contribution by Feralidragon)
* Added a search menu to the code editor (External Contribution by Buggie)
* Made the Unreal Editor keybind scheme configurable by setting the HotkeysSet option in the [Options] section in UnrealEd.ini. Currently supported options are 436 and 469. (External Contribution by Buggie)
* Added a new dialog window that can be used to import compressed mipmaps for an existing texture
* Improved dragging performance in non-realtime viewports by deferring non-realtime viewport rendering to the next Tick()
* Added .obj import/export support for brushes
* Brush importers no longer delete mesh faces with very small areas
* Added compatibility warnings for mods that attempt to call the Locs and Repl functions that were added in UT v451
* Added a "hidden properties" category to the actor properties window (backport from Unreal 227j)
* Added new compatibility warnings for mods that attempt to use the native functions UTPG added in patches 440 and 451
* Added a texture browser menu option to regenerate texture mipmaps
* Added a single-viewport preset for Unreal Editor (External Contribution by Buggie)
* Added a "Copy Actor Properties" option to the actor properties window (External Contribution by Buggie)
* Revamped the code editor window and added features such as block indentation, auto-completion, instant recoloring, (regex) find/replace, a default properties viewer, etc (External Contribution by Buggie)
* Added an Unreal Editor "Recovery Mode" that allows you to save your work in the event of an editor crash (External Contribution by Buggie)
* Added a "Select Matching Surfaces" option to the texture browser (External Contribution by Buggie)
* Added a new option to duplicate/insert actors without moving them away from the position of the duplicated actor (External Contribution by Buggie)
* Improved precision of the font textures generated by the TrueType font factory
* Added dynamic mylevel actor recompilation support. When enabled, the script compiler now allows you to change the class layout of actors that you've placed into your level. The following [Editor.EditorEngine] ini options control this feature's behavior:
```
- WarnForActorRecompilation (Bool - Default Value: True): Warns mappers when they are about to recompile the code for MyLevel actors. The warning explains why recompiling MyLevel actors is dangerous and informs them about the new actor recompilation ini options
- DynamicActorRecompilation (Bool - Default Value: False): Enables dynamic actor recompilation support. When the feature is disabled, Unreal Editor still allows you to recompile MyLevel actors, but the script compiler will not resize Actors after recompilation, nor update their properties to match the new class layout
```
* Unreal Editor now allows you to configure the width of the toolbar on the left-hand side of the screen. You can do this by setting the ToolbarWidth option in the [Options] section of UnrealEd.ini:
```
- ToolbarWidth (Integer - Default Value: 3): The number of buttons on every row of the toolbar
```
(External Contribution by Buggie)

#### UnrealScript

* Added mouse select + copy support to the console window (External Contribution by Buggie)
* Added hostname support to the in-game browser favorites tab (External Contribution by Buggie)
* Added console command history support to the default console (External Contribution by Buggie)
* Made the default HUD display armor values above 150 correctly (External Contribution by Buggie)
* Added a HUD menu option to toggle translucency on your crosshair
* Added new in-game browser options to filter servers by game type and status (External Contribution by Buggie)
* Added custom file encoding support to Engine.StatLog. This new feature allows UnrealScript mods to write files in plain ANSI, UTF-8, or UTF-16LE. Please refer to the Engine.StatLog source code for instructions
* The crosshair dimensions in the hud menu now match their in-game dimensions
* Errors generated by the GetNextIntDesc function are no longer fatal
* UnrealShare.ObjectPath now properly clamps the PathActor's Roll and it retains the initial Roll set on the PathActor (External Contribution by Buggie)
* Increased the size of the Maps array in Engine.MapList from 32 to 4096
* Made the UBrowser favorites dialogs automatically parse addresses pasted into them
* The server browser now allows you to double click and join servers that do not respond to pings (External Contribution by Buggie)
* UTPG's team info enhancement for UdpServerQuery is now enabled by default
* Made the game detect infinite loops in state code
* Made the weapon list resize after dragging the slider in the weapon options menu (External Contribution by Buggie)
* The IpDrv.InternetLink class now has a TextEncoding variable. This variable controls the behavior of text transmitting and receiving functions in InternetLink subclasses. Please refer to the comments in the IpDrv.InternetLink source code for further documentation.

#### Game Client

* Improved cyrillic text support
* The game now keeps rendering while it is displaying a modal dialog or popup menu
* Increased the default value for the maximum number of items in the game cache and made the maximum number of cache items configurable by changing the MaxCacheItems setting in the [Engine.GameEngine] and [Engine.EditorEngine] sections in the game ini
* Improved UTF-8 logging/parsing support in the Windows client
* Added the DynamicFontUnicodeRange option to Engine.Canvas. This option can be used to specify the unicode characters to include in dynamically generated fonts
* The stats font (i.e., the font used for stat net, stat fps, ...) now has a black outline which should greatly improve the font's visibility. Additionally, Render.Render now has five new ini options for stat fonts:

```
- StatOffsetX (Integer - Default Value: 0): Overrides the default horizontal offset of the stats text
- StatOffsetY (Integer - Default Value: 16): Overrides the default vertical offset of the stats text
- StatDrawOutline (Boolean - Default Value: True): If True, stats text will be rendered with a black outline
- StatScaleFont (Boolean - Default Value: True): If True, the stats font will be scaled up at higher resolutions
- StatScaleFactor (Float - Default Value: -1): If -1, Render will automatically determine an appropriate scaling factor. If positive, Render will apply the user-specified scaling factor to the stats font
```

* Disabled anti-aliasing on the smallest UWindow and Ladder fonts
* New icon for the macOS bundle (External Contribution by Älg!)
* Made the game window remember its position across launches (backport from 227)
* Made the game disable the compatibility fixes applied by the GoG game installer. These compatibility fixes caused choppy audio playback and reduced frame rates
* Disabled mouse smoothing by default
* Made mouse input more precise on macOS and Linux
* Windows raw mouse input now also works in windowed mode

#### Audio and 3D Rendering

* Greatly improved performance of OpenGLDrv and XOpenGLDrv
* Added a "OldLitColors" option to Render.Render. This option can be set to true if you want unlit actors to be dimly lit as in UT 436
* ALAudio now uses the correct output device if you select "System Default" as your output device and if you switch audio devices while playing the game (External Contribution by Buggie)
* Improved support for Apple Retina displays
* XOpenGLDrv now supports detail textures (if the DetailMax setting is set to a value higher than 0)

#### Physics and Player Movement

* Improved simulation of players walking on stairs

#### Networking and Netcode

* Fixed a bug that made it impossible to load skins whose names started with the name of a standard skin package (External Contribution by Buggie)
* Spectators now see inventory and armor changes for their viewtargets
* The web admin and udp server query protocol can now transmit information in UTF-8 format. As a result, Unicode playernames, chat messages, etc. should now appear correctly

#### Localization

* New supported (text-only) languages: German (Thanks Smirftsch, eGo, Ividyon and Sly.!), Russian, Portuguese (Thanks Ubir4!), Catalan and Dutch (Thanks bennytrt and Rubie!)
* French (Thanks Hellkeeper!) and Italian (Thanks Alby1987!) from the original MULTI5 release fully updated and fixed
* Moved all localization files into the SystemLocalized folder
* All localization files updated to the latest strings
* All duplicates have been removed
* All Unreal map files were removed
* Layouts of all shared files changed in order to match their new organization (i.e. shared sections between U1 and UT can be now easily copypasted)
* New string ControlPrefix for Domination Point messages for languages that support them (i.e., Spanish and its inverted "!")
* All instances of "Unreal" not named "Unreal Engine" fixed into "Unreal Tournament" (because, well, we're playing Unreal Tournament, not Unreal, lol!)
* All Advanced Options menu settings homogenized into English (sigh) in order to prevent them from breaking third-party files
* All device names shortened in order to fit in the menus (i.e. "Support for OpenAL 3D" -> "OpenAL 3D")
* Added SetupOldUnrealPatch.*
* Botpack.\*: All gametypes moved into new category "Tournament Game Types" in order to separate them from the regular gametypes. "Tournament Game Types" also contains the settings exclusively to the UT-related gametypes
* Core.\*: Added dummy "example" commandlets. The localization of these lines is optional
* Editor.\*:
    * All commandlet weblinks now point to the right page in the OldU Wiki
    * By consensus, all commandlets will be left in English
    * Fixed wrong line reference in PackageFlagCommandlet
* Engine.\*:
    * Added Game Types as a general root
    * Updated the Upgrade URL in [General].
* SetupUnrealTournamentPatch.\*: All files synchronized with the right content.
* Startup.\*:
    * "Chose" -> "Choose"
    * Added new section "[IDDIALOG_ConfigPageMouseInput]" for the new "First Time" window where the user chooses between Cursor, DirectInput and Raw mouse inputs.
    * First-time configuration window title is now "Unreal Tournament Multimedia Configuration", since it now covers more than just Video.
* Udemo.\*: New localized strings
* UMenu.\*: Fixed description of "Invert Mouse" (it talked about the X axis being inverted, it's actually the Y axis)
* UnrealI.\*: Added [NaliPlayer] section
* UTMenu.\*: Added dummy lines. The localization of these lines is optional
* Spanish:
    * All strings adapted to Buggie's templates. This also allowed catching several bugs, untranslated strings and inconsistencies that wouldn't have been caught otherwise
    * Minor fixes and inconsistencies fixed
    * Added missing line in UBrowser.est and fixed key name in UMenu.est and controls tags in UTMenu.est
    * All instances of "You got/picked up..." streamlined into "Has recogido..."

#### Miscellaneous
* The game now prints the game revision to the log file
* UCC now uses UTF-8 string encoding in the Windows terminal

## Unreal Tournament Version 469b Release Notes

Version 469b is completely network compatible with all previous public releases of UT (down to 432).
The UTPG and OldUnreal teams worked hard to maintain binary compatibility with older native mods.
Most of these mods will continue to work in version 469b. However, some mods may need some trivial updates.
If you are a native mod author, and you are having trouble updating your mod for version 469b, then please reach out to us at [the OldUnreal forums](https://www.oldunreal.com/phpBB3/viewforum.php?f=37).
**Note:** This patch disables older versions of ACE.
Server admins should upgrade ACE to version 1.1e or later to check 469b clients.

### Patch Distribution
* The Windows and Mac packages are now digitally signed. This should significantly reduce the amount of false-positive malware warnings.
* Updated the included OpenAL Soft binary for Windows to version 1.21.1
* Updated the included FMOD Engine binaries for all clients to version 2.1.08
* Updated the included libcurl binary for Windows to version 7.72.0_3 (this version will hopefully generate fewer false positive detections by malware scanners)
* Updated the included SDL2 binaries for Linux and macOS to version 2.12

### Stability Improvements

#### Unreal Editor
* Fixed a bug that caused ucc batchexport to crash while exporting native classes
* Fixed bugs that crashed Unreal Editor when attempting to import non-power-of-two (NPOT) textures
* Fixed a bug that caused Unreal Editor to crash when editing certain actor properties in the editactor window
* Fixed a bug that caused Unreal Editor to crash after undoing a transaction that had caused an actor to be renamed (e.g., a duplicate or copy/paste operation)
* Fixed a bug that caused Unreal Editor to crash after editing a combo value in the actor browser
* Fixed a bug that caused Unreal Editor to crash when rebuilding brushes with invalid brush links

#### Physics and Player Movement
* Fixed several FCollisionHash stability problems, including the infamous FCollisionHash::ActorLineCheck crash (thanks Eternity/Feralidragon!)

#### Game Client
* Fixed a bug that caused the game client to crash when resetting configuration options in the preferences window
* Fixed a bug that caused the game to crash when preloading very large textures
* Fixed a bug that caused the garbage collector to crash when loading maps with very long names

#### Audio and 3D Rendering
* Fixed a bug that caused Galaxy to crash during mapswitches if you had UseDigitalMusic set to false
* Fixed a bug that caused Galaxy to crash when playing a mono sound and a stereo/compressed sound simultaneously
* Fixed a bug that caused the game client to crash in scenes with lots of lights in them
* Fixed a bug that caused the game to crash in ProcessDrawCalls when attempting to render a ScriptedTexture with a high-resolution source texture
* Fixed a bug that caused D3D9Drv to crash when attempting to render textures with empty compressed mipmaps
* Fixed a directdraw initialization bug that caused SoftDrv to crash in fullscreen mode

#### Networking and Netcode
* Removed the NumInRec<=RELIABLE_BUFFER assertion which could still be reached by certain server crash tools

### Bug Fixes

#### Unreal Editor
* Fixed a bug that caused the 3D viewport camera to jump when clicking and holding down a mouse button without moving the mouse
* Fixed texture compression artifacts in textures whose width or height were not multiples of 4
* Fixed a problem that caused constant idle CPU usage when using UEd with audio enabled
* Fixed an UnrealEd bug that made it impossible to assign songs to MusicEvents
* Pressing cancel in the file saving dialog now works as expected
* The mover node count check that happens during map saving now works as expected
* Fixed a bug that made UnrealEd's cleanup tool remove original actors too when trying to clean up their duplicates
* Fixed a bug that caused file saving failures for packages that generated compatibility warnings
* Fixed a bug that caused certain actor duplication operations to silently fail

#### Physics and Player Movement
* Restored actor touch behavior for older (<v469) clients and servers
* Fixed a bug that caused collisions with invisible level geometry when playing at extremely high frame rates

#### Networking and Netcode
* Fixed a bug that made the server stop responding to in-game browser queries if there were players in PlayerWaiting or PlayerSpectating state on the server
* Removed the file size check from the HTTP file downloader. This size check prevented players from joining servers when the redirect server sent them a file of a different generation than the one the game server was using
* Fixed a bug that caused certain actor properties not to update after becoming relevant to clients again
* Fixed a bug that made it impossible to play demos recorded on servers running very old versions of UTPure
* Fixed a bug that caused hidden viewtarget actors not to be replicated. This bug broke bunnytrack maps such as BT-OcarinaOfTime

#### Audio and 3D Rendering
* Fixed a bug that caused scriptedtextures (such as the ammo counters on the minigun, rocket launcher, and flak cannon) not to update properly
* Fixed a bug that caused the VSync menu option not to work for XOpenGLDrv
* Fixed a bug that made XOpenGLDrv render complex meshes incorrectly
* Fixed a bug that caused masked textures to render incorrectly in XOpenGLDrv
* Fixed XOpenGLDrv texture decompression for small textures and NPOT textures
* Fixed an ALAudio bug that caused sounds to play from the wrong location
* Fixed a Galaxy bug that broke sound spatialization
* Fixed a bug that caused Cluster to play interface sounds (such as voice taunts) with the wrong pitch
* Fixed a bug that could cause ALAudio music playback to stop randomly
* Fixed an XOpenGLDrv bug that caused smallwave textures to be rendered as unmasked textures
* Fixed an XOpenGLDrv bug that caused part of the viewport to be invisible when going into fullscreen mode from a max-sized window
* Fixed a bug that caused D3DDrv screenshots to be blank when using windowed mode
* Fixed a bug that caused D3D10Drv and D3D11Drv to change the windowed mode resolution when going into fullscreen mode using ALT+ENTER
* Fixed a bug that caused objects behind mirrors to be visible in OpenGLDrv and XOpenGLDrv
* Fixed a bug that made the shield belt effect visible while spectating a player with behindview 0
* Fixed a bug that caused unlit meshes in fog zones to be rendered without texturing
* Fixed a bug that caused the pulsegun to be rendered in the wrong position when holding it in your left or right hand
* Fixed a bug that made announcer sounds (such as CTF events) too quiet when using Galaxy
* Fixed an XOpenGLDrv bug that caused decals to render incorrectly
* Fixed a bug that caused textures to render with the wrong PolyFlags when setting UsePrecache to true in the renderer settings
* Restored the old sound culling behavior for older clients connected to 469 servers
* Fixed a bug that could cause sounds produced by moving actors to be culled despite being in range of the listener

#### UnrealScript
* Fixed a bug that made it possible to cycle through AnnouncerSpectators (which UTv469 uses to play announcersounds) using F5 or Viewclass binds
* Fixed bugs that made it impossible to load mods that imported color palettes from the original Botpack, UnrealI, or UnrealShare packages
* Fixed the broken polygon in the ripper gun
* Fixed a bug that made the ammo bar in the HUD not to scale properly at high resolutions
* Fixed a bug that caused the in-game voice menu to have large black borders under certain conditions
* Teleporting with the translocator no longer causes you to start falling if you were flying at the start of the teleport
* ViewShake now allows the camera roll to reset to 0 at high framerates (External Contribution by Deaod)
* SendServerMove now sends the correct viewrotation to the server (External Contribution by Deaod)
* The rocket launcher lock-on crosshair now scales correctly with custom crosshair scaling options (External Contribution by Deaod)

#### Miscellaneous
* Fixed a bug that caused the game to parse commandline parameters incorrectly when the game was launched from a folder containing spaces
* Added the missing TTF fonts to the Linux patch package
* Fixed a bug that made Setup.exe not read the Manifest.int file in a umod if you already had a Manifest in your System folder
* Fixed bugs that broke savegame saving and loading on Linux and macOS

### Enhancements

#### Unreal Editor
* Added a new package verification routine that can detect and fix up packages that are incompatible with previous versions of UT. This routine automatically runs while compiling/saving a package.
* Made the font size for the game/UEd log windows configurable in the ini
* Optimized bulk actor deletion
* Oversized textures in the texture browser now get clipped rather than ignored
* Added "Import CompMips" button to the texture browser. This allows you to import and compress hi-res image data and add it to an existing texture
* Made BC3/DXT5 the default compressed texture format for textures whose source image has alpha channel data
* The model points count is now visible on the build sheet

#### Game Client
* Made the game client automatically load the default viewport manager when the configured viewport manager fails to load (e.g., when trying to load SDLDrv on Windows)
* Made the driver and preference caching system filter out duplicates. This fixes the duplicate entries some Linux and macOS players were seeing in the game menus (e.g., in the list of game types or skins)
* The top right corner of the in-game menu bar now includes additional version information
* The renderer no longer gets destroyed when switching between windowed mode and fullscreen mode
* The Linux client now has an (experimental) wxWidgets-based launcher (wx-ut-bin-<arch>). This launcher adds support for the "preferences" console command. It requires wxWidgets 3.1.4. (External Contribution by Buggie)
* The client now retains the INI, USERINI, LOG, LANPLAY, and NEWWINDOW command line options when relaunching

#### UnrealScript
* Restored compatibility with a couple of older mods that replace the game menu
* Added new crosshair rendering options to the in-game menu
* Merged several improvements to the in-game voice menu, including numbered labels, larger lists, and scrolling in larger steps. (External Contribution by Buggie)
* CTF flags now automatically respawn and get returned to their flag base if they get destroyed. This allows CTF flags to work on maps with CloudZones or TriggeredDeath triggers. The fix is enabled by default but can be disabled by setting Botpack.CTFGame.bAutoRespawnFlags to false. (External Contribution by Buggie)
* The pulse beam no longer despawns if you hold the pulsegun altfire button for more than 60 seconds

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
* The garbage collector now tracks and cleans up actor references stored in object default properties

## Unreal Tournament Version 469a Release Notes

Version 469a is completely network compatible with all previous public releases of UT (down to 432).
The UTPG and OldUnreal teams worked hard to maintain binary compatibility with older native mods.
Most of these mods will continue to work in version 469a. However, some mods may need some trivial updates.
If you are a native mod author, and you are having trouble updating your mod for version 469, then please reach out to us at [the OldUnreal forums](https://www.oldunreal.com/phpBB3/viewforum.php?f=37).
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

#### Localization

* New language: German (requires testing)
* Italian and French have been fully updated (both require testing)
* Minor changes to Spanish

#### Miscellaneous

* UnrealEd and the game client are now large address aware on Windows. This means it is far less likely that you'll run out of virtual memory.
* Removed some outdated items from the in-game menu (e.g., ngWorldStats, mplayer, heat, won, ...)
* Rewrote some of the core timing routines so the game runs more smoothly (and with less glitching) on multicore CPUs and in long-running games.
* The Linux and Mac clients finally support unicode! The most visible consequence is that player names with non-ascii characters in them will now display correctly when playing on Linux servers (provided that you use font textures with the proper unicode glyphs).
* The game now uses UTF-8 as the prefered file encoding (unless a UTF-16LE BOM is found at the start of the file).
* Added selected cursor support to the Linux and Mac clients.
* Added the -FORCELOGFLUSH command line option. This option makes the game/server flush the log file every time it is written to.
* Added the -SETHOMEDIR= command line option. Normally, the game looks for the UnrealTournament.ini and User.ini files in \~/.utpg/System (on Linux), \~/Library/Application Support/Unreal Tournament/System (on Mac), or in UnrealTournament\System (on Windows). With this option, you can override the preferences path (e.g., ./ut-bin-x86 -sethomedir=\~/.loki/ut/System).
* Made pulsegun and minigun lockdown a configurable option that is disabled by default.
* UnrealI and UnrealShare decorations can no longer be destroyed if they have bStatic set.
* Merged Unreal 227's UnrealI and UnrealShare AI fixes.

## Old Release Notes

The release notes for older patches released by Epic and UTPG can be found in the Help/ReleaseNotes.htm file which is included in the patch.
