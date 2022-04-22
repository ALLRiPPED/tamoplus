#!/bin/bash
# local_installer.sh
# Updated script by Chad "thepitster" Ward https://github.com/ALLRiPPED/ 
# & The Supreme Team https://github.com/SupremePi/
#############################################
# Install Themes and Music Overlay Plus
#############################################
ver="v1.20"
SCRIPT_LOC="$HOME/tamoplus/BGM.py"
INSTALL_DIR="$HOME/tamoplus"
THEMES_DIR="/opt/retropie/configs/all/emulationstation/themes"
MUSIC_DIR="$HOME/RetroPie/roms/music"
MUSIC_DIR="${MUSIC_DIR/#~/$HOME}"
MENU_DIR="$HOME/RetroPie/retropiemenu"
STMENU_DIR="$HOME/RetroPie/retropiemenu/visualtools"
ES_SETTINGS="/opt/retropie/configs/all/emulationstation/es_settings.cfg"
AUTOSTART="/opt/retropie/configs/all/autostart.sh"
RUNONSTART="/opt/retropie/configs/all/runcommand-onstart.sh"
RUNONEND="/opt/retropie/configs/all/runcommand-onend.sh"
PYGAME_PKG="python3-pygame"
PSUTIL_PKG="omxplayer python-pygame mpg123 imagemagick python-urllib3 libpng12-0 fbi python-pip python3-pip python3-psutil"

cd $HOME
currentuser=$(whoami) # Check user and then stop the script if root
if [[ $currentuser == "root" ]]; then echo "DON'T RUN THIS SCRIPT AS ROOT! USE './local_installer.sh' !"; exit; fi

infobox=""
infobox="${infobox}_______________________________________________________\n\n"
infobox="${infobox}\n"
infobox="${infobox}TAMO+ Install Script\n\n"
infobox="${infobox}The background music python and control scripts have been installed on this system.\n"
infobox="${infobox}This script will play MP3 & OGG files during menu navigation in either Emulation Station or Attract mode.\n"
infobox="${infobox}A Few subfolders have been created in the $HOME/RetroPie/roms/music directory for\n"
infobox="${infobox}\"halloween\" (Halloween), \"xmas\" (Christmas), \"strangerthings\" (Stranger Things), and\n"
infobox="${infobox}\"devilschromey\" (Retro-Devils). This includes themes, music, splashscreens, and game videoloadingscreens.\n"
infobox="${infobox}Also you have \"arcade\" (Arcade), \"st\" (Suprememe Team), \"uvf\"\n"
infobox="${infobox}(Ultimate Vs Fighter), \"venom\" (Venom), \"pistolero\" (Pistolero),  and this last one\n"
infobox="${infobox}\"custom\" (Custom) is for placing your own MP3 files into.\n"
infobox="${infobox}Also included in this script is the ability to select between the different music folders you can disable\n"
infobox="${infobox}them all or enable them, but only one at a time, the music will then automatically start playing.\n"
infobox="${infobox}Launch a game, the music will stop. Upon exiting out of the game the music will begin playing again.\n"
infobox="${infobox}This also lets you turn off certain options for BGM.py such as, Enable/Disable the Overlay, Fadeout effect,\n"
infobox="${infobox}Rounded Corners on Overlays, an option to turn the dashes, or hyphens, with a space on both sides\n"
infobox="${infobox}\" - \"\n"
infobox="${infobox}and separate the song title to a separate new lines.\n"
infobox="${infobox}\n"
infobox="${infobox}Overlay disappeared when you change resolutions? Set postion to Top-Left so you can see\n"
infobox="${infobox}it then set it to desired postition, compatible with all resolutions.\n\n"
infobox="${infobox}_______________________________________________________\n\n"
dialog --backtitle "TAMO+ Install Script $ver" --title "TAMO+ Install Script $ver" --msgbox "${infobox}" 35 110

main_menu() {
    local choice
    while true; do
        choice=$(dialog --backtitle "TAMO+ Install Script $ver" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose An Option Below" 25 85 20 \
            01 "Minimal Install No Extra Music" \
            02 "Install without Custom Music" \
            03 "Full Install All Music" \
            2>&1 > /dev/tty)
        case "$choice" in
            01) install_tamoplus ;;
            02) install_tamoplus_1 ;;
            03) install_tamoplus_2 ;;
             *) break ;;
        esac
    done
}

install_tamoplus() {
minimum=1
clear
prep_work
if [ -f "$MUSIC_DIR/halloween/1.mp3" ] && [ -f "$MUSIC_DIR/strangerthings/01. Stranger Things.mp3" ] && [ -f "$MUSIC_DIR/xmas/Sleigh Ride.mp3" ]
then echo "Theme Music Found!"
else
        if [ -f "$HOME/tamoplus/thememusic.zip" ]; then echo "Extracting Theme Music"; unzip -uq $HOME/tamoplus/thememusic.zip -d $HOME/RetroPie
		echo "Theme Music Extracting Complete"
	 else
		echo "Extracting Theme Music"
		gdown https://drive.google.com/uc?id=1-Gctmc_AAp-MMOr265vZfjfTijLUN_6M -O $HOME/tamoplus/thememusic.zip
		unzip -uq $HOME/tamoplus/thememusic.zip -d $HOME/RetroPie; echo "Theme Music Extraction Complete"; fi
fi
setup
rebootq
exit
}

install_tamoplus_1(){
minimum=0
clear
prep_work
if [ -f "$MUSIC_DIR/halloween/1.mp3" ] && [ -f "$MUSIC_DIR/strangerthings/01. Stranger Things.mp3" ] && [ -f "$MUSIC_DIR/xmas/Sleigh Ride.mp3" ] && [ -f "$MUSIC_DIR/pistolero/Terminator 2 Theme.mp3" ]
then echo "Theme Music Found!"
else
	if [ -f "$HOME/tamoplus/thememusic.zip" ]; then echo "Extracting Theme Music"; unzip -uq $HOME/tamoplus/thememusic.zip -d $HOME/RetroPie
		echo "Theme Music Extracting Complete"
	else
		echo "Extracting Theme Music"
		gdown https://drive.google.com/uc?id=1-Gctmc_AAp-MMOr265vZfjfTijLUN_6M -O $HOME/tamoplus/thememusic.zip
		unzip -uq $HOME/tamoplus/thememusic.zip -d $HOME/RetroPie; echo "Theme Music Extraction Complete"
	fi
fi
if [ -f "$MUSIC_DIR/arcade/arcade81.mp3" ]; then echo "BGM Found Music!"; else
	if [ -f "$HOME/tamoplus/bgm.zip" ]; then echo "Extracting BGM Music"; unzip -uq $HOME/tamoplus/bgm.zip -d $HOME/RetroPie
		echo "BGM Music Extraction Complete"
	else
		echo "Extracting BGM Music"
		gdown https://drive.google.com/uc?id=1-GLqdCNpH0i3zKRAJDOWwxfaP2gVGaC4 -O $HOME/tamoplus/bgm.zip
		unzip -uq $HOME/tamoplus/bgm.zip -d $HOME/RetroPie; echo "BGM Music Extraction Complete"
	fi
fi
setup
rebootq
exit
}

install_tamoplus_2(){
minimum=0
clear
prep_work
if [ -f "$MUSIC_DIR/halloween/1.mp3" ] && [ -f "$MUSIC_DIR/strangerthings/01. Stranger Things.mp3" ] && [ -f "$MUSIC_DIR/xmas/Sleigh Ride.mp3" ]
then echo "Theme Music Found!"
else
	if [ -f "$HOME/tamoplus/thememusic.zip" ]; then echo "Extracting Theme Music"; unzip -uq $HOME/tamoplus/thememusic.zip -d $HOME/RetroPie
		echo "Theme Music Extracting Complete"
	else
		echo "Extracting Theme Music"
		gdown https://drive.google.com/uc?id=1-Gctmc_AAp-MMOr265vZfjfTijLUN_6M -O $HOME/tamoplus/thememusic.zip
		unzip -uq $HOME/tamoplus/thememusic.zip -d $HOME/RetroPie; echo "Theme Music Extraction Complete"
	fi

fi
if [ -f "$MUSIC_DIR/arcade/arcade81.mp3" ]; then echo "BGM Found Music!"; else
	if [ -f "$HOME/tamoplus/bgm.zip" ]; then echo "Extracting BGM Music"; unzip -uq $HOME/tamoplus/bgm.zip -d $HOME/RetroPie
		echo "BGM Music Extraction Complete"
	else
		echo "Extracting BGM Music"
		gdown https://drive.google.com/uc?id=1-GLqdCNpH0i3zKRAJDOWwxfaP2gVGaC4 -O $HOME/tamoplus/bgm.zip
		unzip -uq $HOME/tamoplus/bgm.zip -d $HOME/RetroPie; echo "BGM Music Extraction Complete"
	fi
fi
if [ -f "$MUSIC_DIR/custom/3 Inches Of Blood- Deadly Sinners.mp3" ]; then echo "Custom Found Music!"; else
	if [ -f "$HOME/tamoplus/custombgm.zip" ]; then echo "Extracting CustomBGM Music"; unzip -uq $HOME/tamoplus/custombgm.zip -d $HOME/RetroPie
		rm -f $MUSIC_DIR/custom/'No Music in Folder.mp3'
		echo "CustomBGM Music Extracting Complete"
	else
		echo "Extracting CustomBGM Music"
		gdown https://drive.google.com/uc?id=1-BHwb4oT6GiwpRv7l3VLHuJLsRxScGNV -O $HOME/tamoplus/custombgm.zip
		unzip -uq $HOME/tamoplus/custombgm.zip -d $HOME/RetroPie
		rm -f $MUSIC_DIR/custom/'No Music in Folder.mp3'
		echo "CustomBGM Music Extraction Complete"
	fi
fi
setup
rebootq
exit
}

prep_work() {
echo "Please Note If On A supreme Build This Instaler Will Remove The Audio Tools And Visual tools menus that will be added Into Tamo Plus"
sleep 3

if [ -d "/home/pi/RetroPie/scripts/.sb-unified" ]; then

#Supreme ES Edits
if [ -d /home/pi/RetroPie/retropiemenu/audiotools ]; then sudo rm -r /home/pi/RetroPie/retropiemenu/audiotools; fi
if [ -d /home/pi/RetroPie/retropiemenu/visualtools  ]; then sudo rm -r /home/pi/RetroPie/retropiemenu/visualtools; fi

#Supreme Attract mode Edits
if [ ! -d "/opt/retropie/configs/all/attractmode" ]; then mkdir /opt/retropie/configs/all/attractmode; ln -s /home/pi/.attract/* /opt/retropie/configs/all/attractmode/; fi
if [ -f /opt/retropie/configs/all/attractmode/romlists/Audio\ tools.txt ]; then sudo mv /opt/retropie/configs/all/attractmode/romlists/Audio\ tools.txt /opt/retropie/configs/all/attractmode/romlists/Audio\ tools.txt.bk; fi
if [ -f /opt/retropie/configs/all/attractmode/romlists/Visual\ tools.txt  ]; then sudo mv /opt/retropie/configs/all/attractmode/romlists/Visual\ tools.txt /opt/retropie/configs/all/attractmode/romlists/Visual\ tools.txt.bk; fi
if [ -f /opt/retropie/configs/all/attractmode/emulators/Visual\ tools.cfg ]; then sudo mv /opt/retropie/configs/all/attractmode/emulators/Visual\ tools.cfg /opt/retropie/configs/all/attractmode/emulators/Visual\ tools.cfg.bk; fi
if [ -f /opt/retropie/configs/all/attractmode/emulators/Audio\ tools.cfg ]; then sudo mv /opt/retropie/configs/all/attractmode/emulators/Audio\ tools.cfg /opt/retropie/configs/all/attractmode/emulators/Audio\ tools.cfg.bk; fi
   
cat <<\EOF152935 > "/opt/retropie/configs/all/attractmode/romlists/Settings.txt"
#Name;Title;Emulator;CloneOf;Year;Manufacturer;Category;Players;Rotation;Control;Status;DisplayCount;DisplayType;AltRomname;AltTitle;Extra;Buttons
Controller tools;/ Controller Tools;@;;;;;;;;;0;;;;;
Emulation tools;/ Emulation Tools;@;;;;;;;;;0;;;;;
Retropie tools;/ Retropie Tools;@;;;;;;;;;0;;;;;
tamoplus;Tamo Plus;Settings;;;;;;;;;;;;;;
displayutility;Display Utility;Settings;;;;;;;;;;;;;;
basicinfo;Retropie Basic Infos;Settings;;;;;;;;;;;;;;
favorites;Favorites Utility;Settings;;;;;;;;;;;;;;
fixmybuild;Fix My Build;Settings;;;;;;;;;;;;;;
frontendselector;Front End Selector;Settings;;;;;;;;;;;;;;
attract-systems-detection;Attract Systems Detection;Settings;;;;;;;;;;;;;;
#systemsnapswitch;Systems snaps switch;Settings;;;;;;;;;;;;;;
raspiconfig;Raspi Config;Settings;;;;;;;;;;;;;;
rpsetup;Retropie Setup;Settings;;;;;;;;;;;;;;
reboot;Reboot;Settings;;;;;;;;;;;;;;
shutdown;Shutdown;Settings;;;;;;;;;;;;;;
EOF152935
sudo chmod +x /opt/retropie/configs/all/attractmode/romlists/Settings.txt
fi

echo "Installing Needed Packages"
sleep 3
sudo apt-get update -y
if sudo apt-get --simulate install $PYGAME_PKG; then sudo apt-get install -y $PYGAME_PKG; else
	echo "Unable to install python-pygame, please update your system (\"sudo apt-get upgrade && sudo apt-get update\") and then try running this script again!"
	exit
fi
sudo apt-get install -y $PSUTIL_PKG # to generate overlays
sudo pip install requests gdown
cd ~

##### Disable ODROID BGM script if it exists
if [ -a $HOME/scripts/bgm/start.sc ]; then pkill -STOP mpg123; sudo rm $HOME/scripts/bgm/start.sc; fi

##### Code by RapidEdwin08 from IMP https://github.com/RapidEdwin08/imp.git
##### Disable 0ther BGMs Indiscriminately
sudo pkill -STOP mpg123 > /dev/null 2>&1
sudo pkill -KILL mpg123 > /dev/null 2>&1
##### Disable Livewire
if [ ! -f ~/.DisableMusic ]; then touch ~/.DisableMusic; fi
if [ -f $HOME/RetroPie/retropiemenu/bgm-mute.sh ]; then mv $HOME/RetroPie/retropiemenu/bgm-mute.sh $HOME/RetroPie/retropiemenu/bgm-mute.sh.tamoplus; fi
##### Disable BGM Naprosnia
sudo pkill -STOP audacious > /dev/null 2>&1
sudo pkill -KILL audacious > /dev/null 2>&1
if [ -f ~/RetroPie-BGM-Player/bgm_system.sh ]; then bash ~/RetroPie-BGM-Player/bgm_system.sh -setsetting bgm_toggle 0; fi
if [ -f ~/RetroPie/retropiemenu/RetroPie-BGM-Player.sh ]; then mv ~/RetroPie/retropiemenu/RetroPie-BGM-Player ~/RetroPie/retropiemenu/RetroPie-BGM-Player.sh.tamoplus 2>/dev/null; fi
##### Disable BGM Rydra
sudo systemctl stop bgm > /dev/null 2>&1
sudo systemctl disable bgm > /dev/null 2>&1
##### Disable BGM 0fficialPhilcomm
sudo systemctl stop retropie_music > /dev/null 2>&1
sudo systemctl disable retropie_music > /dev/null 2>&1
##### Final daemon-reload after Disable 0ther BGMs
sudo systemctl daemon-reload > /dev/null 2>&1
##### Remove other stray BGMs
if [ -f "$HOME/BGM.py" ]; then rm -f $HOME/BGM.py; fi
if [ -f "$MUSIC_DIR/BGM.py" ]; then rm -f $MUSIC_DIR/BGM.py; fi


# Create both empty runcommand files if not already exist or make backup.
if [ ! -f /opt/retropie/configs/all/runcommand-onstart.sh ]; then
	echo '' > /opt/retropie/configs/all/runcommand-onstart.sh
	sudo chmod +x /opt/retropie/configs/all/runcommand-onstart.sh
else
	cp /opt/retropie/configs/all/runcommand-onstart.sh /opt/retropie/configs/all/runcommand-onstart.sh.tamoplus 2>/dev/null         
fi

if [ ! -f /opt/retropie/configs/all/runcommand-onend.sh ]; then
	echo '' > /opt/retropie/configs/all/runcommand-onend.sh
	sudo chmod +x /opt/retropie/configs/all/runcommand-onend.sh
else
	cp /opt/retropie/configs/all/runcommand-onend.sh /opt/retropie/configs/all/runcommand-onend.sh.tamoplus 2>/dev/null         
fi

# Create or make backup of autostart.sh.
if [ ! -f /opt/retropie/configs/all/autostart.sh ]; then
	echo '' > /opt/retropie/configs/all/autostart.sh
	sudo chmod +x /opt/retropie/configs/all/autostart.sh
else
	cp /opt/retropie/configs/all/autostart.sh /opt/retropie/configs/all/autostart.sh.tamoplus 2>/dev/null         
fi

# Getting Themes
echo "Downloading the files needed and installing the script + utilities"
if [ ! -d  "$THEMES_DIR/halloweenspecial" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-halloweenspecial.git" "/opt/retropie/configs/all/emulationstation/themes/halloweenspecial"; fi
if [ ! -d  "$THEMES_DIR/merryxmas" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-merryxmas.git" "/opt/retropie/configs/all/emulationstation/themes/merryxmas"; fi
if [ ! -d  "$THEMES_DIR/carbonite" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-carbonite.git" "/opt/retropie/configs/all/emulationstation/themes/carbonite"; fi
if [ ! -d  "$THEMES_DIR/devilchromey" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-devil-chromey.git" "/opt/retropie/configs/all/emulationstation/themes/devilchromey"; fi
if [ ! -d  "$THEMES_DIR/strangerstuff" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-strangerstuff.git" "/opt/retropie/configs/all/emulationstation/themes/strangerstuff"; fi
if [ ! -d  "$THEMES_DIR/pistolero" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-pistolero.git" "/opt/retropie/configs/all/emulationstation/themes/pistolero"; fi
if [ ! -d  "$THEMES_DIR/pleasureparadise" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-pleasureparadise.git" "/opt/retropie/configs/all/emulationstation/themes/pleasureparadise"; fi

if [[ $currentuser == "pi" ]]; then #Use pngview if using Raspberry Pi
	if [ -f "/usr/local/bin/pngview" ]; then echo "Found pngview!"; else
		sudo chmod +x ~/tamoplus/pngview
		sudo cp ~/tamoplus/pngview /usr/local/bin/
	fi
elif [[ $currentuser == "pigaming" ]]; then
	sudo apt-get install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev # Install ODROID stuff
	git clone https://github.com/AreaScout/Gaming-Kit-Tools.git
	cd $HOME/tamoplus/Gaming-Kit-Tools
	make
	sudo make install
fi

cd $HOME/tamoplus/
sudo cp -f $HOME/tamoplus/GROBOLD.ttf /usr/share/fonts/truetype/
sleep 1
if [ ! -d  "$MUSIC_DIR" ]; then mkdir $MUSIC_DIR; else echo "$MUSIC_DIR Exists!"; fi	

##### Will add Default missing EmulationStation settings
if [ ! -f  "/opt/retropie/configs/all/emulationstation/es_settings.cfg" ]; then
cat <<\EOF15293 > "/opt/retropie/configs/all/emulationstation/es_settings.cfg"
<?xml version="1.0"?>
<bool name="BackgroundJoystickInput" value="false" />
<bool name="CaptionsCompatibility" value="true" />
<bool name="CollectionShowSystemInfo" value="true" />
<bool name="DisableKidStartMenu" value="true" />
<bool name="DrawFramerate" value="false" />
<bool name="EnableSounds" value="true" />
<bool name="ForceDisableFilters" value="false" />
<bool name="LocalArt" value="false" />
<bool name="MoveCarousel" value="true" />
<bool name="ParseGamelistOnly" value="false" />
<bool name="QuickSystemSelect" value="true" />
<bool name="ScrapeRatings" value="true" />
<bool name="ScreenSaverControls" value="true" />
<bool name="ScreenSaverOmxPlayer" value="true" />
<bool name="ScreenSaverVideoMute" value="false" />
<bool name="ShowHelpPrompts" value="true" />
<bool name="ShowHiddenFiles" value="false" />
<bool name="SlideshowScreenSaverCustomImageSource" value="false" />
<bool name="SlideshowScreenSaverRecurse" value="false" />
<bool name="SlideshowScreenSaverStretch" value="false" />
<bool name="SortAllSystems" value="false" />
<bool name="StretchVideoOnScreenSaver" value="false" />
<bool name="SystemSleepTimeHintDisplayed" value="false" />
<bool name="UseCustomCollectionsSystem" value="true" />
<bool name="VideoAudio" value="true" />
<bool name="VideoOmxPlayer" value="false" />
<int name="MaxVRAM" value="80" />
<int name="ScraperResizeHeight" value="0" />
<int name="ScraperResizeWidth" value="400" />
<int name="ScreenSaverSwapImageTimeout" value="10000" />
<int name="ScreenSaverSwapVideoTimeout" value="30000" />
<int name="ScreenSaverTime" value="300000" />
<int name="SubtitleSize" value="55" />
<int name="SystemSleepTime" value="0" />
<string name="AudioCard" value="default" />
<string name="AudioDevice" value="HDMI" />
<string name="CollectionSystemsAuto" value="" />
<string name="CollectionSystemsCustom" value="" />
<string name="GamelistViewStyle" value="automatic" />
<string name="OMXAudioDev" value="both" />
<string name="PowerSaverMode" value="disabled" />
<string name="SaveGamelistsMode" value="on exit" />
<string name="Scraper" value="TheGamesDB" />
<string name="ScreenSaverBehavior" value="dim" />
<string name="ScreenSaverGameInfo" value="never" />
<string name="SlideshowScreenSaverBackgroundAudioFile" value="/home/pi/.emulationstation/slideshow/audio/slideshow_bg.wav" />
<string name="SlideshowScreenSaverImageDir" value="/home/pi/.emulationstation/slideshow/image" />
<string name="SlideshowScreenSaverImageFilter" value=".png,.jpg" />
<string name="StartupSystem" value="" />
<string name="SubtitleAlignment" value="left" />
<string name="SubtitleFont" value="/usr/share/fonts/truetype/freefont/FreeSans.ttf" />
<string name="SubtitleItalicFont" value="/usr/share/fonts/truetype/freefont/FreeSansOblique.ttf" />
<string name="ThemeSet" value="pistolero" />
<string name="TransitionStyle" value="fade" />
<string name="UIMode" value="Full" />
<string name="UIMode_passkey" value="uuddlrlrba" />
EOF15293
sudo chmod +x /opt/retropie/configs/all/emulationstation/es_settings.cfg
fi

echo "Prep Work All Done. Downloading Music"
}

setup() {
echo "Music All Done. Final Setup Commencing"
echo "Add menu options for BGM Overlay Controls"
cp $HOME/tamoplus/tamoplus.png $MENU_DIR/icons/
if [ -f "$MENU_DIR/tamoplus.sh" ]; then sudo rm -f $MENU_DIR/tamoplus.sh; fi
if [ -f "$STMENU_DIR/tamoplus.sh" ]; then sudo rm -f $STMENU_DIR/tamoplus.sh; fi
if [ -d "$STMENU_DIR" ]; then RP_MENU=$STMENU_DIR; else RP_MENU=$MENU_DIR; fi
if [ "$minimum" = "1" ]; then
	sudo chmod +x $HOME/tamoplus/tamoplus-minimum.sh
	sudo chown $currentuser:$currentuser $HOME/tamoplus/tamoplus-minimum.sh
	cp tamoplus-minimum.sh $RP_MENU/tamoplus.sh
else
	sudo chmod +x $HOME/tamoplus/tamoplus.sh
	sudo chown $currentuser:$currentuser $HOME/tamoplus/tamoplus.sh
	cp tamoplus.sh $RP_MENU
fi

if [ ! -s $MENU_DIR/gamelist.xml ]; then sudo rm -f $MENU_DIR/gamelist.xml; fi
if [ ! -f "$MENU_DIR/gamelist.xml" ]; then cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml $MENU_DIR/gamelist.xml; fi
if [ -d "$STMENU_DIR" ]; then
CONTENT1="\t<game>\n\t\t<path>./visualtools/tamoplus.sh</path>\n\t\t<name>TAMO+</name>\n\t\t<desc>TAMO+ stands for Theme and Music Overlay Plus, more. It's a script that changes between themes and their Background Music.</desc>\n\t\t<image>./icons/tamoplus.png</image>\n\t\t<releasedate>20220422T010251</releasedate>\n\t\t<developer>thepitster, Supreme Team</developer>\n\t\t<publisher>thepitster</publisher>\n\t\t<genre>TAMO+ Script</genre>\n\t</game>"
C1=$(echo $CONTENT1 | sed 's/\//\\\//g')
else
CONTENT1="\t<game>\n\t\t<path>./tamoplus.sh</path>\n\t\t<name>TAMO+</name>\n\t\t<desc>TAMO+ stands for Theme and Music Overlay Plus, more. It's a script that changes between themes and their Background Music.</desc>\n\t\t<image>./icons/tamoplus.png</image>\n\t\t<releasedate>20220422T010251</releasedate>\n\t\t<developer>thepitster, Supreme Team</developer>\n\t\t<publisher>thepitster</publisher>\n\t\t<genre>TAMO+ Script</genre>\n\t</game>"
C1=$(echo $CONTENT1 | sed 's/\//\\\//g')
fi
if grep -q tamoplus.sh "$MENU_DIR/gamelist.xml"; then echo "gamelist.xml entry confirmed"
else
	sed "/<\/gameList>/ s/.*/${C1}\n&/" $MENU_DIR/gamelist.xml > /tmp/temp.xml
	cat /tmp/temp.xml > $MENU_DIR/gamelist.xml
	rm -f /tmp/temp.xml
fi

echo "Setting up Splash, Exit, and Game Launching Screens"

gdown https://drive.google.com/uc?id=1002ccXpBnKgrSBT8lD-nbU9xGHY2emVE -O $HOME/tamoplus/tamoplus-screens.zip
unzip -uq $HOME/tamoplus/tamoplus-screens.zip -d $HOME/RetroPie; echo "TAMO+ Screens Extraction Complete"

if [ ! -d  "/opt/retropie/configs/all/emulationstation/scripts/reboot" ]; then
mkdir -p /opt/retropie/configs/all/emulationstation/scripts/reboot
cat <<\EOF1293 > "/opt/retropie/configs/all/emulationstation/scripts/reboot/exit-splash"
#! /bin/bash
# /etc/init.d/start-sound

omxplayer --vol 250 --amp 250 -b /home/pi/RetroPie/splashscreens/JarvisExit.mp4 > /dev/null 2>&1
EOF1293
sudo chmod +x /opt/retropie/configs/all/emulationstation/scripts/reboot/exit-splash
fi

if [ ! -d  "/opt/retropie/configs/all/emulationstation/scripts/shutdown" ]; then
mkdir -p /opt/retropie/configs/all/emulationstation/scripts/shutdown
cat <<\EOF18293 > "/opt/retropie/configs/all/emulationstation/scripts/shutdown/exit-splash"
#! /bin/bash
# /etc/init.d/start-sound

omxplayer --vol 250 --amp 250 -b /home/pi/RetroPie/splashscreens/JarvisExit.mp4 > /dev/null 2>&1
EOF18293
sudo chmod +x /opt/retropie/configs/all/emulationstation/scripts/shutdown/exit-splash
fi

#Added Supreme Marquee and Script
cd $HOME
git clone https://github.com/SupremePi/PieMarquee2.git
chmod 777 $HOME/PieMarquee2

sudo apt-get update
sudo apt-get install omxplayer libjpeg8 imagemagick -y

sudo rm -rf /opt/retropie/configs/all/PieMarquee2/
mkdir /opt/retropie/configs/all/PieMarquee2/
cp -f -r $HOME/PieMarquee2/PieMarquee2 /opt/retropie/configs/all/

if [ -f "/home/pi/PieMarquee2/scripts/supreme-marquee-tool.sh" ]; then sudo mv -f /home/pi/PieMarquee2/scripts/supreme-marquee-tool.sh $TAMPO_DIR/scripts/; fi
sudo cp -f $HOME/PieMarquee2/scripts/asplashscreen.sh /opt/retropie/supplementary/splashscreen/

chmod 755 /opt/retropie/configs/all/PieMarquee2/omxiv-marquee
chmod 755 /home/pi/RetroPie/retropiemenu/supreme-marquee-tool.sh
sudo chmod 755 /opt/retropie/supplementary/splashscreen/asplashscreen.sh

#Do Auto Start Edits for marquee#
ifexist3489=`cat /opt/retropie/configs/all/autostart.sh |grep isdual |wc -l`

if [[ ${ifexist3489} > 0 ]]; then
  echo -e "$(tput setaf 2)Marquee Script Already Found But Will Now Enable! $(tput sgr0)"
  echo "already in autostart.sh" > /tmp/exists
  sed -i '/#isdual=`tvservice -l |grep "2 attached device" |wc -l`/c\isdual=`tvservice -l |grep "2 attached device" |wc -l`' /opt/retropie/configs/all/autostart.sh
else
cat <<\EOF12389 > "/tmp/templist-marquee"
isdual=`tvservice -l |grep "2 attached device" |wc -l`
if [[ $isdual == "1" ]]; then
fbset -fb /dev/fb0 -g 1920 1080 1920 1080 16
/usr/bin/python /opt/retropie/configs/all/PieMarquee2/PieMarquee2.py &
fi
EOF12389
sed -i -f - /opt/retropie/configs/all/autostart.sh < <(sed 's/^/1i/' /tmp/templist-marquee)
fi

filefound11=`cat /opt/retropie/configs/all/autostart.sh |grep tamoplus |wc -l`
if [[ ${filefound11} > 0 ]]; then

   echo -e "$(tput setaf 2)Tamo+ Script Already Found in Auto Start But Will Now Enable! $(tput sgr0)"
   echo "already in autostart.sh" > /tmp/exists
   (nohup python /home/pi/tamoplus/BGM.py > /dev/null 2>&1) &

else

	filefound88=`cat /opt/retropie/configs/all/autostart.sh |grep mpg123 |wc -l`
	if [[ ${filefound88} > 0 ]]; then

		echo -e "$(tput setaf 2)Found An Old Version Of Mpg123 Installed Removing It And Installing The Tamo+ Version! $(tput sgr0)"
		sleep 3      
		sed -i '/^while pgrep omxplayer/d' $AUTOSTART
		sed -i '/^#while pgrep omxplayer/d' $AUTOSTART
		sed -i '/^(sleep 10; mpg123/d' $AUTOSTART
		sed -i '/^#(sleep 10; mpg123/d' $AUTOSTART

cat <<\EOF123 > "/tmp/templist"
(nohup python /home/pi/tamoplus/BGM.py > /dev/null 2>&1) &
EOF123
   sed -i -f - /opt/retropie/configs/all/autostart.sh < <(sed 's/^/1i/' /tmp/templist)
   sed -i -e '$a/opt/retropie/configs/all/emulationstation/scripts/shutdown/exit-splash\npgrep -f "BGM.py" |xargs sudo kill -9 > /dev/null 2>&1 &\npgrep -f pngview|xargs sudo kill -9 > /dev/null 2>&1 &' $AUTOSTART
   echo -e "$(tput setaf 2)Done! $(tput sgr0)"
   sleep 3
   clear
else
   echo -e "$(tput setaf 2)Now Installing The Supreme Version of TAMO+! $(tput sgr0)"
   sleep 3    
cat <<\EOF123 > "/tmp/templist"
(nohup python /home/pi/tamoplus/BGM.py > /dev/null 2>&1) &
EOF123
		sed -i -f - /opt/retropie/configs/all/autostart.sh < <(sed 's/^/1i/' /tmp/templist)
		sed -i -e '$a/opt/retropie/configs/all/emulationstation/scripts/shutdown/exit-splash\npgrep -f "BGM.py" |xargs sudo kill -9 > /dev/null 2>&1 &\npgrep -f pngview|xargs sudo kill -9 > /dev/null 2>&1 &' $AUTOSTART

		echo -e "$(tput setaf 2)Done! $(tput sgr0)"
		sleep 3
		clear
	fi
fi
                                
filefound2=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep mpg123 |wc -l`
if [[ ${filefound2} > 0 ]]; then
sed -i '/pkill -STOP mpg123/d' $RUNONSTART
fi


ifexist2=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep videoloadingscreens= |wc -l`
if [[ ${ifexist2} > 0 ]]; then
  echo -e "$(tput setaf 2)Tamo+ Script Already Found In Runcommand But Will Now Enable! $(tput sgr0)"
  echo "already in runcommand-onstart.sh" > /tmp/exists

else

cat <<\EOF1234 > "/tmp/templist2"
#!/bin/sh
### Begin VideoLoading Screens Function
enablevideolaunch="true"
videoloadingscreens="/home/pi/RetroPie/videoloadingscreens/jarvis"
if [[ $enablevideolaunch == "true" ]]; then
 # Extract file name from called ROM
 gname="$(basename "$3")"
 # build path to file and remove extension from ROM to add mp4 extension
 # $HOME variable will help users that are not stick to raspberry ;)
 ifgame="$videoloadingscreens/$1/${gname%.*}.mp4"
 ifsystem="$videoloadingscreens/$1.mp4"
 default="$videoloadingscreens/default.mp4"
 # If condition to check filename with -f switch, f means regular file
 if [[ -f $ifgame ]]; then
    omxplayer --vol 250 --amp 250 -b "$ifgame" > /dev/null 2>&1
 elif [[ -f $ifsystem ]]; then
    omxplayer --vol 250 --amp 250 -b "$ifsystem" > /dev/null 2>&1
 elif [[ -f $default ]]; then
    omxplayer --vol 250 --amp 250 -b "$default" > /dev/null 2>&1
 fi
fi
### End VideoLoading Screens Function
EOF1234
sed -i -f - /opt/retropie/configs/all/runcommand-onstart.sh < <(sed 's/^/1i/' /tmp/templist2)
fi

filefound3=`cat /opt/retropie/configs/all/runcommand-onend.sh |grep mpg123 |wc -l`
if [[ ${filefound3} > 0 ]]; then
sed -i '/pkill -CONT mpg123/d' $RUNONEND
fi

ifexist3=`cat /opt/retropie/configs/all/runcommand-onend.sh |grep omxplayer |wc -l`
if [[ ${ifexist3} > 0 ]]; then
  echo -e "$(tput setaf 2)Tamo+ Script Already Found In Runcommand! $(tput sgr0)"
  echo "already in runcommand-onend.sh" > /tmp/exists

else

cat <<\EOF12345 > "/tmp/templist3"
#! /bin/bash
# /etc/init.d/start-sound
sudo omxplayer --vol 250 --amp 250 -b /home/pi/RetroPie/splashscreens/ThanksForPlaying.mp4 > /dev/null 2>&1
EOF12345
sed -i -f - /opt/retropie/configs/all/runcommand-onend.sh < <(sed 's/^/1i/' /tmp/templist3)
fi

echo -e "$(tput setaf 2)Done! $(tput sgr0)"
sleep 3
clear

CUR_THM=$(grep "<string name=\"ThemeSet\"" "$ES_SETTINGS"|awk '{print $3}')
NEW_THM="value=\"carbonite\""
if [ $CUR_THM == $NEW_THM ]; then echo "Theme already set!"; else sed -i -E "s|${CUR_THM}|${NEW_THM}|g" $ES_SETTINGS; fi
sudo sed -i -E "s/.*/\/home\/pi\/RetroPie\/splashscreens\/JarvisSplash.mp4/" /etc/splashscreen.list
cd $HOME
##### Explain stuff to the user
ending=""
ending="${ending}TAMO+ and is now installed.\n"
ending="${ending}Run $RP_MENU/tamoplus.sh or navigate to:\n"
if [ -d "$STMENU_DIR" ]; then ending="${ending}Retropie > Visualtools > TAMO+, for more options!\n"; else ending="${ending}Retropie > TAMO+, for more options!\n"; fi
ending="${ending}BGM has also been set up to run automatically when the device boots!\n"
ending="${ending}Thanks for trying out TAMO+\n\n"
dialog --backtitle "TAMO+ Install Script $ver" \
	--title "TAMO+ Install Script $ver" \
	--msgbox "${ending}" 35 110
}

rebootq() {
    local choice
    while true; do
        choice=$(dialog --colors --backtitle "Would You Like To Reboot So The Changes Can Take Effect? [Y/n]" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose An Option Below" 25 85 20 \
            01 "Reboot Later and keep zips" \
            02 "Reboot Now and keep zips" \
            03 "Rebot Later and Delete zips" \
            04 "Reboot Now and Delete zips" \
            2>&1 > /dev/tty)
        case "$choice" in
            01) rebootl ;;
            02) rebootn ;;
            03) rebootld ;;
            04) rebootnd ;;
            *)  break ;;
        esac
    done
}

rebootl() {
	sleep 1
	exit
}

rebootn() {
	sleep 1
	sudo reboot
}

rebootld() {
	rm -f $HOME/tamoplus/*.zip
	echo -e "$(tput setaf 2)Zip Files Deleted$(tput setaf 0)"
	sleep 1
	exit
}

rebootnd() {
	rm -f $HOME/tamoplus/*.zip
	echo -e "$(tput setaf 2)Zip Files Deleted$(tput setaf 0)"
	sleep 1
	sudo reboot
}

main_menu
