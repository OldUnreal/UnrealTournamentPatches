# OldUnreal Patch Repository for Unreal Tournament (99)

This is the public repository for [OldUnreal's](https://www.oldunreal.com/index.html) Unreal Tournament 99 patches. OldUnreal took over maintenance of the Unreal Tournament code base after reaching an agreement with [Epic Games](https://www.epicgames.com) in 2019.

Our patches fix hundreds of stability, security and performance problems in the game client, the server, and in Unreal Editor. They also add support for modern platforms and operating systems (such as macOS Catalina), and add new 3d renderers, audio drivers and minor features (such as raw input and high-resolution font/GUI scaling) to better leverage the capabilities of modern gaming systems.

Patch releases hosted here are considered stable enough for widespread use, but they are by no means a finished product. We still release updates on a regular basis.

**Legal Disclaimer:** This project was approved by Epic Games, but it is not an official Epic project, nor has it been reviewed or tested by Epic.

## Installation

This repository contains development snapshots as well as official releases.

### Development Snapshots

If you are a modder or beta tester and you would like to test our latest changes, then simply use git to check out this repository. Note, however, that development snapshots may be less stable than the official releases.

### Official Releases

Our official patch releases can be found on the [Releases Page](https://github.com/OldUnreal/UnrealTournamentPatches/releases). If you are a regular player or if you want to play online, then please use official releases only.

> [!IMPORTANT]
> If you want to test out our patches, but maintain the possibility to uninstall them, we strongly urge you to create a backup of your entire UT folder before installing the patch.

## Windows Installation

### Windows 7 or later

We distribute our patches for modern **Windows** systems in multiple formats. We recommend that you run the exe installer to patch your game.

However, you can also simply unpack the zip package **on top of an existing installation** of Unreal Tournament. No other actions are needed to install the patch.

### Windows XP and Vista

The **legacy Windows** version of our patch is only available as a zip package. You can install this patch by unpacking the zip file **on top of an existing installation** of Unreal Tournament. No other actions are needed to install the patch.

> [!NOTE]
> * Some features may be unavailable for Windows XP and Vista systems.
> * The patch for Windows XP and Vista is experimental and (mostly) untested.
> * Windows XP and Vista support will be removed from future patches.

## Linux Installation

The **Linux** version of our patch is only available as a tarball. To install, unpack the tarball **on top of an existing installation** of Unreal Tournament.

Alternatively, to spare you the pain of using Wine to install the Windows version, you can unpack our patch into an empty directory, which we will refer to as the **game directory**. You can then install the rest of the game as follows:

> [!NOTE]
> The directory names below are Case Sensitive!

1) **Mount** the UT (GOTY) cd/image or unpack the GOG distribution with the **innoextract** tool. We will refer to the root directory of your game cd/image or GOG distribution as the **distribution directory**.
2) Copy the **Music** and **Sounds** directories from the distribution directory into the game directory.
3) Copy the contents of the **Textures** directory from the distribution directory into the existing Textures directory within your game directory **WITHOUT REPLACING** the existing files.
> [!CAUTION]
> Make sure you do not overwrite the Texture files that came with the patch, otherwise the in-game text will render incorrectly.
4) Create a **Maps** directory within the game directory and copy over the unpacked Maps (i.e., map files with a .unr extension) from the distribution directory.
5) Extract all compressed maps (i.e., maps with a .uz extension) into your game's Maps directory as follows. If there are no compressed maps in your game distribution folder, you may ignore this step.
```
for i in <path-to-distribution-directory>/Maps/*.uz; do <path-to-game-directory>/System/ucc-bin decompress $i; done
mv ~/.utpg/System/*.unr <path-to-game-directory>/Maps/
```

> [!CAUTION]
> Please ensure that you do **NOT** copy the contents of the System directory in your cd/GoG image into the game directory, otherwise the game will not launch!

At this point you're all set.

To install the content from the GOTY cd 2 or bonus packs:
1) Repeat the procedure above with the Maps, Sounds, and Textures directories.
2) Copy the .u and .int files to the game's System directory.

> [!NOTE]
> Our patch includes several 3rd party libraries, including SDL2 and OpenAL-Soft. These libraries were built and tested on Debian-based systems. However, if you run a non-Debian-based distribution and if you run into any trouble (e.g., audio not working), we highly recommend that you delete libSDL2 and libopenal from your UnrealTournament/System folder and install your distribution's version of SDL2 and OpenAL-Soft instead. Please contact your distro maintainer for instructions.

No other actions are needed to install the patch.

## macOS Installation

The macOS version of our patch comes as an application bundle. You should drag this bundle into your applications library. If you're installing our macOS patch for the first time, you will also need to copy the data files from an existing UT installation into your Application Support Library. To install the data files, you need to do the following:
1. Open a new Finder window
2. Press ⇧⌘G to bring up the "Go to folder:" dialog
3. Enter "~/Library/Application Support/" (without the quotes!) in the edit box and click ok
4. Within the ~/Library/Application Support/ folder, create a new folder called "Unreal Tournament" (without the quotes!)
5. Copy the Maps, Sounds, Textures, and Music folders from your existing UT installation into the folder you've just created
6. Go into the Textures folder and delete the LadderFonts.utx and UWindowFonts.utx files
7. Extract all compressed maps (i.e., maps with a .uz extension) into your game's Maps directory as follows. If there are no compressed maps in your game distribution folder, you may ignore this step.
Open a terminal window and run the following commands:
```
for file in ~/Library/Application\ Support/Unreal\ Tournament/Maps/*.uz; do /Applications/UnrealTournament.app/Contents/MacOS/UCC decompress $file; done
mv ~/Library/Application\ Support/Unreal\ Tournament/System/*.unr ~/Library/Application\ Support/Unreal\ Tournament/Maps/
rm ~/Library/Application\ Support/Unreal\ Tournament/Maps/*.uz
```

> [!CAUTION]
> Please ensure that you do **NOT** copy the contents of the original game's System directory into ~/Library/Application Support/, otherwise the game will not launch!

After installing the data files, you should be able to launch the UnrealTournament app!

This [YouTube clip](https://youtu.be/wEC1M6EdDnA) shows you what the installation procedure is supposed to look like on macOS.

## System Requirements

Windows and Linux systems will need a CPU with **SSE2** instruction set support. In practice, this means all 64-bit x86 CPUs, all Intel CPUs since (and including) the Pentium 4, and all AMD CPUs since (and including) the Athlon 64 are supported.

Windows systems will need to run Windows 7 or later, although a custom stripped-down patch is available for Windows XP and Vista.

Linux systems will need GNU libc 2.19 or later. 

macOS systems will need a 64-bit x86 or Apple Silicon CPU and Mac OS X Mavericks (10.9) or later. Some rendering features may be unavailable on macOS.

## Features

Besides fixing hundreds of bugs, the OldUnreal UT patches also add features such as:
* Raw input support and full mouse smoothing control
* OldUnreal's latest OpenGL 4-based 3D renderer (XOpenGLDrv)
* OldUnreal's latest OpenAL-based audio driver (ALAudio)
* Han's latest FMOD-based audio driver (Cluster)
* SDL2-based window management for the Linux and macOS clients
* The latest Demo Manager
* Unreal 227's Unreal Editor 2.2 (with many UT-specific enhancements)
* PNG support for screenshots
* Scaling control for in-game fonts and the game menu
* UTF-8 support for game ini, int, and log files
* Faster server downloads (even without redirect servers)
* Mouse wheel scrolling support for the game menu
* High-DPI awareness for the game and Unreal Editor
* Updated versions of Chris Dohnal's UTGLR OpenGLDrv and D3D9Drv renderers
* An updated in-game server browser with lots of quality-of-life improvements

A full list of patch features and changes is available in the [Release Notes](https://github.com/OldUnreal/UnrealTournamentPatches/blob/master/ReleaseNotes.md). 

## Compatibility

While the OldUnreal patches preserve compatibility with the original game as well as most mods made for the original game, there are a couple of compatibility issues people should be aware of.

### For Players

All UnrealScript mods for UT v451b or lower will continue to work in OldUnreal's v469 or later. The following native (C++) mods for older UT versions will not work in v469:

* XC_Engine v24 or below: v469-compatible versions of XC_Engine are available [here](https://ut99.org/viewforum.php?f=63)
* Demo Manager 3.4 or below: Our patches include an updated Demo Manager so there is no need to downgrade to an older version
* D3D8Drv: D3D8Drv will crash in v469. We are not planning to fix this
* D3D10Drv: D3D10Drv has some rendering glitches and does not work in Unreal Editor 2.2
* D3D11Drv: There are three different Direct3D 11-based renderers for UT: dpJudas' [D3D11Drv](https://github.com/dpjudas/UT99VulkanDrv), Metallicafan212's [ICBINDx11Drv](https://github.com/metallicafan212/ICBINDx11Drv), and Darknovismc's D3D11Drv (available on moddb).
The former two specifically target UT v469 and will come bundled with the 469e patch. The latter one targets older versions of UT, but works fine in-game in UT v469 nonetheless. It will crash in Unreal Editor, however.

### For Server Admins

Most UnrealScript mods for UT v451b or lower will continue to work on OldUnreal's v469 or later servers. Some old anti-cheat mods such as CSHP4 and AnthChecker will reject v469 clients, however.

The following native (C++) server mods will not work in v469:
* ServerCrashFix: there is no need to install this mods as all of its fixes have been integrated into the OldUnreal patches
* ACE v1.1f or below: will continue to work on Windows servers but not on Linux servers. Server admins who wish to run ACE on their Linux servers must upgrade to ACE v1.2 or later
* XC_Engine v24 or below: Most of the bug fixes in XC_Engine have been integrated into the OldUnreal patches. Server admins who rely on XC_Engine for its advanced features must upgrade to XC_Engine v25 or later. You can download the latest XC_Engine [here](https://ut99.org/viewforum.php?f=63)

### For Developers

OldUnreal's patches add some new UnrealScript features which should not be used in mods that target compatibility with UT v451b or below. We are working on a document that lists the new features and that describes best practices for developers.

Native mod developers may want to use our updated UT SDK, which will be hosted in this repository.

## Malware Warnings

> [!IMPORTANT]
> Our Windows and macOS binaries are digitally signed, but malware/virus scanners may occasionally still flag them as potential malware because our signing certificate is still building up reputation. Additional information can be found [here](https://www.digicert.com/blog/ms-smartscreen-application-reputation/). 

## Donations

> [!NOTE]
> We are all volunteers who work on Unreal and Unreal Tournament in our spare time. If you like our work, then please consider making a small donation [here](https://www.oldunreal.com/phpBB3/donate). Please make sure to mention Unreal Tournament in your donation note!

## Other Contributions

We are more than happy to accept other contributions too. Some of the things we could use help with are:

* Installers: The Linux and Mac versions of the patch currently lack an installer script/program. We would gladly accept 3rd party installers contributed by community members.
* Missing localizations: the new patches include several new in-game menu options as well as new 3D renderers and audio drivers. The text displayed by these new components is currently available in 11 out of 16 planned languages (new languages marked with (\*)): English, German (\*), French, Spanish, Italian, Russian (\*), Polish (\*), Portuguese (\*), Catalan (\*), Dutch (\*) and Greek (\*). While we tried to do the best job as possible with these localizations, the new languages as well as the new lines in the existing languages must be reviewed by native speakers. If you want to contribute to these localizations as well as working on the other WIP localizations, you can lend us a hand in [our Localization Project](https://github.com/NeonKnightOA/unreal-localization).
* Hardware: If you have any decent hardware that you want to donate, then please send a direct message to Smirftsch or anth through the OldUnreal forum. We are especially looking for more macOS development systems.

## Bug Reports

You can use our [issue tracker](https://github.com/OldUnreal/UnrealTournamentPatches/issues) to file bug reports. Reasonable feature requests for Unreal Editor can also be posted there. Please do not ask for new features in the game itself as these are out of the scope of our project.

> [!IMPORTANT]
> Before filing a bug report, please use the GitHub search function to see if someone else has already reported the same issue. If you find an issue that looks similar to yours, then please submit a comment in the existing issue report.
> When filing a bug report, please include relevant details about your setup (i.e., your operating system and version, your UT version and build date, mods you are using) and describe how we can reproduce the problem.

## Credits

The primary developers for OldUnreal's Unreal Tournament patches are: [AnthraX](https://github.com/stijn-volckaert), [Higor](https://github.com/CacoFFF), [Buggie](https://github.com/SeriousBuggie), [Dots](https://github.com/Marco888), and [Smirftsch](https://github.com/Smirftsch).

We also want to recognize the hard work of the many beta testers and contributors in our community:
* Chamberly, Casey: for the many internal bug reports and mental support
* Ooper: for catching a lot of the early bugs
* Feralidragon, Berserker, Che, Sizzl: for extensive testing and feedback on Unreal Editor
* Lightning: for the new HD UMenu textures
* Sizzl, batonix, ue, Zim: for extensive testing and feedback on the game server
* uZi, batonix, zkyp, and the members of the UTCTF.pug community: for helping us debug the invisible weapon/flag problem
* Sp0ngeb0b, proasm, Deepu: for extensive testing and feedback on UnrealScript-related issues
* Eternity: for helping us solve the FCollisionHash problem
* Dizzy and NuLL: for helping us solve the invisible collision problem
* Deaod: for feedback on our movement updates and various bug fixes
* Metallicafan212 and dpJudas: for bug reports, fixes, and productive discussions on various rendering issues
* Masterkent: for the widescreen fov fix
* rX and Metallicafan212: for donating testing/debugging hardware for XOpenGLDrv

Localization credits:
* Epic Games/Digital Extremes/Legend Entertainment: Original English/German/French/Spanish/Italian localizations
* Smirftsch: Initial project coordination.
* Victor Delacroix: Early project coordination.
* Hellkeeper: Early project coordination.
* Neon_Knight: Current project coordination.
* Buggie: Localization templates for all 15 languages.
* **_German:_** **Smirftsch, Jan "eGo" Urbansky, ividyon** and **Sly.** (review and contributions), **hosterholz** (additional contributions)
* **_French:_** **Hellkeeper** (review), **Rackover/Louvenarde** (additional contributions)
* **_Spanish:_** **Neon_Knight** (review), **rarsonic** (additional contributions)
* **_Italian:_** **Alby1987** (review), **UBerserker, BBG-(DOG)-, Lowenz** and **TaglesMalsto** (additional contributions)
* **_Russian:_** **u.HighPriest** (original Unreal localization), **Lynx** (original UT localization), **Reborn** (reviews) **Skaarj ZR, FLAK, ArchGrey** and **Sergei** (additional contributions)
* **_Polish:_** **Victor Delacroix** (original Unreal localization), **yrex.** (additional contributions)
* **_Portuguese:_** **Nahand** (original Unreal localization), **BIr4** (review), **Naruto_9** (additional contributions)
* **_Catalan:_** **rarsonic** (additional contributions)
* **_Dutch:_** **Rubie** (review), **bennytrt and Hyper** (additional contributions)
* **_Greek:_** **LDinos** (author)

Finally, we want to express our sincerest gratitude to the following people:
* Stacey Conley (aka "Flak"): this project would not have happened without her. Thank you Stacey, you are amazing!
* Ryan C. Gordon (aka "icculus"): for his hard work on UT over the years and for SDL2. If you like Ryan's work, then please consider [supporting him](https://www.patreon.com/icculus).
* Chris Dohnal: for contributing the UTGLR OpenGL and Direct3D 9 renderers.
