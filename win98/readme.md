## Windows 98 Guide

#### Filepath for Games:
`Emulation\roms\win98\GAME_1\GAME1_CD1.iso`

(All the iso files for GAME_1 go into the GAME_1 folder)
### NO SPACING IN ANY GAME OR DIRECTORY

#### Filepath for Bios:
`Emulation\bios\win98`

( Location for Windows installation disk image and .bat file provided)

Follow this guide for installing Windows 98 in DOSBOX-X on your PC:

Installation Method 2:
[Installing Microsoft Windows 98 in DOSBox-X](https://dosbox-x.com/wiki/Guide%3AInstalling-Windows-98)

#### DO NOT ADD ANY CODE IN THE [autoexec] SECTION OF YOUR CONFIG FILE.

Once windows is installed and booting correctly, you should have a hdd.img and win98.conf located in DOSBOX-X folder.

The win98.conf file can be created with the Configuration Tool or by copying and renaming the DosBox-x.conf file. Edit as desired. I have provided a complete config file to copy.

To add Windows 98 to Emulation Station, edit the es_systems.xml files provided with Emulation Station, located at: `C:\Users\USER\EmuDeck\EmulationStation-DE\ES-DE\custom_systems`

```
<system>
    <name>win98</name>
    <fullname>Windows 98</fullname>
    <path>%ROMPATH%\win98</path>
    <extension>.iso .ISO</extension>
    <command>"C:\Emulation\bios\win98\win98.bat" %ROM%</command>
    <platform>pc</platform>
    <theme>win98</theme>
</system>
```
an example of the es_systems.xml file is available in this repo.

Create or copy the win98.bat file provided and place in the win98 bios folder with the installation disk image.

Edit the filepaths as required for your setup. Use the SwapCD in DOS menu or hotkeys to switch Game CD when prompted.