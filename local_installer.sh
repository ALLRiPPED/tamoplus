#!/bin/bash
# local_installer.sh
# Updated script by Chad "thepitster" Ward https://github.com/ALLRiPPED/ 
# & The Supreme Team https://github.com/SupremePi/
#############################################
# Install Themes and Music Overlay Plus
#############################################
currentuser=$(whoami) # Check user and then stop the script if root later on
. /home/$currentuser/tamoplus/scripts/tamo-vars
PYGAME_PKG="python3-pygame"
PSUTIL_PKG="omxplayer python-pygame mpg123 imagemagick python-urllib3 libjpeg8 libpng12-0 fbi python-pip python3-pip python3-psutil"

if [[ $currentuser == "root" ]]; then echo "DON'T RUN THIS SCRIPT AS ROOT! USE './local_installer.sh' !"; exit; fi
cd $HOME

if [ ! -d "$HOME/RetroPie" ] && [ ! -d "$HOME/RetroPie-Setup" ]; then
	errorbox=""
	errorbox="${errorbox}_______________________________________________________\n\n"
	errorbox="${errorbox}\n"
	errorbox="${errorbox}TAMO+ is meant to be installed with use of RetroPie\n"
	errorbox="${errorbox}Please Install RetroPie first.\n"
	errorbox="${errorbox}Then try to install TAMO+ Again.\n\n"
	errorbox="${errorbox}_______________________________________________________\n\n"
	dialog --backtitle "TAMO+ Install Script $ver" --title "TAMO+ Install Script $ver" --msgbox "${errorbox}" 0 0
	exit 1
fi

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
            01 "Bare Install No Themes or Music Just Tools" \
            02 "Minimal Install Themesets But No Extra Music" \
            03 "Full Install All Themesets But No Custom Music" \
            04 "Full Install All Themesets And Music" \
            2>&1 > /dev/tty)
        case "$choice" in
            01) install_tamoplus_bare ;;
            02) install_tamoplus_minimal ;;
            03) install_tamoplus_1 ;;
            04) install_tamoplus_2 ;;
             *) break ;;
        esac
    done
}

install_tamoplus_bare() {
minimum=2
clear
prep_work
setup
install_ending
exit
}

install_tamoplus_minimal() {
minimum=1
clear
prep_work
download_themes
echo "Prep Work All Done. Downloading Music"
download_thememusic
echo "Music All Done. Final Setup Commencing"
download_videos
setup
install_ending
exit
}

install_tamoplus_1() {
minimum=0
clear
prep_work
download_themes
echo "Prep Work All Done. Downloading Music"
download_thememusic
download_bgmusic
echo "Music All Done. Final Setup Commencing"
download_videos
setup
install_ending
exit
}

install_tamoplus_2() {
minimum=0
clear
prep_work
download_themes
echo "Prep Work All Done. Downloading Music"
download_thememusic
download_bgmusic
download_custommusic
echo "Music All Done. Final Setup Commencing"
download_videos
setup
install_ending
exit
}

download_themes() {
# Downloading Themes
echo "Downloading the files needed and installing the script + utilities"
if [ ! -d  "$THEMES_DIR/halloweenspecial" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-halloweenspecial.git" "/opt/retropie/configs/all/emulationstation/themes/halloweenspecial"
else cd /opt/retropie/configs/all/emulationstation/themes/halloweenspecial; git pull; git reset --hard; fi
if [ ! -d  "$THEMES_DIR/merryxmas" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-merryxmas.git" "/opt/retropie/configs/all/emulationstation/themes/merryxmas"
else cd /opt/retropie/configs/all/emulationstation/themes/merryxmas; git pull; git reset --hard; fi
if [ ! -d  "$THEMES_DIR/carbonite" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-carbonite.git" "/opt/retropie/configs/all/emulationstation/themes/carbonite"
else cd /opt/retropie/configs/all/emulationstation/themes/carbonite; git pull; git reset --hard; fi
if [ ! -d  "$THEMES_DIR/devilchromey" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-devil-chromey.git" "/opt/retropie/configs/all/emulationstation/themes/devilchromey"
else cd /opt/retropie/configs/all/emulationstation/themes/devilchromey; git pull; git reset --hard; fi
if [ ! -d  "$THEMES_DIR/strangerstuff" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-strangerstuff.git" "/opt/retropie/configs/all/emulationstation/themes/strangerstuff"
else cd /opt/retropie/configs/all/emulationstation/themes/strangerstuff; git pull; git reset --hard; fi
if [ ! -d  "$THEMES_DIR/Supreme_Space" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-Supreme_Space.git" "/opt/retropie/configs/all/emulationstation/themes/Supreme_Space"
else cd /opt/retropie/configs/all/emulationstation/themes/Supreme_Space; git pull; git reset --hard; fi
if [ ! -d  "$THEMES_DIR/pistolero" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-pistolero.git" "/opt/retropie/configs/all/emulationstation/themes/pistolero"
else cd /opt/retropie/configs/all/emulationstation/themes/pistolero; git pull; git reset --hard; fi
if [ ! -d  "$THEMES_DIR/pleasureparadise" ]; then
git clone "https://github.com/ALLRiPPED/es-theme-pleasureparadise.git" "/opt/retropie/configs/all/emulationstation/themes/pleasureparadise"
else cd /opt/retropie/configs/all/emulationstation/themes/pleasureparadise; git pull; git reset --hard; fi
}

download_videos() {
echo "Setting up Splash, Exit, and Game Launching Screens"
if [ -f "$HOME/RetroPie/videoloadingscreens/default.mp4" ]; then echo "Default Launch Screen Found Moving to default folder"
	if [ ! -d "$HOME/RetroPie/videoloadingscreens/default" ]; then mkdir $HOME/RetroPie/videoloadingscreens/default; fi
	mv -f $HOME/RetroPie/videoloadingscreens/* $HOME/RetroPie/videoloadingscreens/default
else echo "Moving Default Launch Screens to default folder"
	mv -f $HOME/RetroPie/videoloadingscreens/* $HOME/RetroPie/videoloadingscreens/default
fi
echo -e "$(tput setaf 2)Done! $(tput sgr0)"
sleep 1
if [ -f "$SPLASH_DIR/CharlieBrown.mp4" ] && [ -f "$SPLASH_DIR/Halloween.mp4" ] && [ -f "$SPLASH_DIR/JarvisSplash.mp4" ] && [ -f "$SPLASH_DIR/ThanksForPlaying.mp4" ]
then echo "Splash, Exit, and Game Launching Screens Found!"
else
	if [ -f "$HOME/tamoplus/tamoplus-screens.zip" ]; then echo "Extracting Splash, Exit, and Game Launching Screens"; unzip -uq $HOME/tamoplus/tamoplus-screens.zip -d $HOME/RetroPie
		echo "Splash, Exit, and Game Launching Screens Extracting Complete"
	else
		echo "Downloading Splash, Exit, and Game Launching Screens"
		gdown https://drive.google.com/uc?id=1002ccXpBnKgrSBT8lD-nbU9xGHY2emVE -O $HOME/tamoplus/tamoplus-screens.zip
		echo "Downloading Complete, Now Extracting Splash, Exit, and Game Launching Screens"
		unzip -uq $HOME/tamoplus/tamoplus-screens.zip -d $HOME/RetroPie; echo "Splash, Exit, and Game Launching Screens Extracting Complete"
	fi
fi
}

download_thememusic() {
if [ -f "$MUSIC_DIR/halloween/1.mp3" ] && [ -f "$MUSIC_DIR/strangerthings/01. Stranger Things.mp3" ] && [ -f "$MUSIC_DIR/xmas/Sleigh Ride.mp3" ]
then echo "Theme Music Found!"
else
	if [ -f "$HOME/tamoplus/thememusic.zip" ]; then echo "Extracting Theme Music"; unzip -uq $HOME/tamoplus/thememusic.zip -d $HOME/RetroPie
		echo "Theme Music Extracting Complete"
	else
		echo "Downloading Theme Music"
		gdown https://drive.google.com/uc?id=1-Gctmc_AAp-MMOr265vZfjfTijLUN_6M -O $HOME/tamoplus/thememusic.zip
		echo "Downloading Complete, Now Extracting Theme Music"
		unzip -uq $HOME/tamoplus/thememusic.zip -d $HOME/RetroPie; echo "Theme Music Extracting Complete"
	fi
fi
}

download_bgmusic() {
if [ -f "$MUSIC_DIR/arcade/arcade81.mp3" ]; then echo "BGM Found Music!"; else
	if [ -f "$HOME/tamoplus/bgm.zip" ]; then echo "Extracting BGM Music"; unzip -uq $HOME/tamoplus/bgm.zip -d $HOME/RetroPie
		echo "BGM Music Extraction Complete"
	else
		echo "Downloading BGM Music"
		gdown https://drive.google.com/uc?id=1-GLqdCNpH0i3zKRAJDOWwxfaP2gVGaC4 -O $HOME/tamoplus/bgm.zip
		echo "Downloading Complete, Now Extracting BGM Music"
		unzip -uq $HOME/tamoplus/bgm.zip -d $HOME/RetroPie; echo "BGM Music Extracting Complete"
	fi
fi
}

download_custommusic() {
if [ -f "$MUSIC_DIR/custom/3 Inches Of Blood- Deadly Sinners.mp3" ]; then echo "Custom Found Music!"; else
	if [ -f "$HOME/tamoplus/custombgm.zip" ]; then echo "Extracting CustomBGM Music"; unzip -uq $HOME/tamoplus/custombgm.zip -d $HOME/RetroPie
		rm -f $MUSIC_DIR/custom/'No Music in Folder.mp3'
		echo "CustomBGM Music Extracting Complete"
	else
		echo "Downloading CustomBGM Music"
		gdown https://drive.google.com/uc?id=1-BHwb4oT6GiwpRv7l3VLHuJLsRxScGNV -O $HOME/tamoplus/custombgm.zip
		echo "Downloading Complete, Now Extracting CustomBGM Music"
		unzip -uq $HOME/tamoplus/custombgm.zip -d $HOME/RetroPie
		rm -f $MUSIC_DIR/custom/'No Music in Folder.mp3'
		echo "CustomBGM Music Extraction Complete"
	fi
fi
}

prep_work() {
chmod 755 $INSTALL_DIR/scripts/*
if [ -f /etc/sbu/sbu.sh ]; then
	echo "Please Note On A Supreme Build This Installer Will Remove The Audio Tools And Visual tools menus that will be added By TAMO+"
	echo "You can put them back with Fix My Build in the RetroPie Menu"
	sleep 3
else
	echo "Please Note This Installer Will Remove The Audio Settings, ES Themes, and Splash Screens menus that will be added By Tamo Plus"
	sleep 3
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

# Normal RetroPie Menu Edits
if [ -f "$MENU_DIR/audiosettings.rp" ]; then sudo mv $MENU_DIR/audiosettings.rp $MENU_DIR/audiosettings.rp.bk; fi
if [ -f "$MENU_DIR/esthemes.rp" ]; then sudo mv $MENU_DIR/esthemes.rp $MENU_DIR/esthemes.rp.bk; fi
if [ -f "$MENU_DIR/splashscreen.rp" ]; then sudo mv $MENU_DIR/splashscreen.rp $MENU_DIR/splashscreen.rp.bk; fi
# Supreme ES Edits
if [ -d "/home/pi/RetroPie/scripts/.sb-unified" ]; then

	# Supreme RetroPie Menu Edits
	if [ -d /home/pi/RetroPie/retropiemenu/audiotools ]; then sudo rm -r /home/pi/RetroPie/retropiemenu/audiotools; fi
	if [ -d /home/pi/RetroPie/retropiemenu/controllertools ]; then sudo rm -r /home/pi/RetroPie/retropiemenu/controllertools; fi
	if [ -d /home/pi/RetroPie/retropiemenu/visualtools ]; then sudo rm -r /home/pi/RetroPie/retropiemenu/visualtools; fi

	# Supreme Attract mode Edits
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

cd $HOME

# Disable ODROID BGM script if it exists
if [ -a $HOME/scripts/bgm/start.sc ]; then pkill -STOP mpg123; sudo rm $HOME/scripts/bgm/start.sc; fi

# Code by RapidEdwin08 from IMP https://github.com/RapidEdwin08/imp.git
# Disable 0ther BGMs Indiscriminately
sudo pkill -STOP mpg123 > /dev/null 2>&1
sudo pkill -KILL mpg123 > /dev/null 2>&1
# Disable Livewire
if [ ! -f $HOME/.DisableMusic ]; then touch $HOME/.DisableMusic; fi
if [ -f $HOME/RetroPie/retropiemenu/bgm-mute.sh ]; then mv $HOME/RetroPie/retropiemenu/bgm-mute.sh $HOME/RetroPie/retropiemenu/bgm-mute.sh.tamoplus; fi
# Disable BGM Naprosnia
sudo pkill -STOP audacious > /dev/null 2>&1
sudo pkill -KILL audacious > /dev/null 2>&1
if [ -f $HOME/RetroPie-BGM-Player/bgm_system.sh ]; then bash $HOME/RetroPie-BGM-Player/bgm_system.sh -setsetting bgm_toggle 0; fi
if [ -f $HOME/RetroPie/retropiemenu/RetroPie-BGM-Player.sh ]; then mv $HOME/RetroPie/retropiemenu/RetroPie-BGM-Player ~/RetroPie/retropiemenu/RetroPie-BGM-Player.sh.tamoplus 2>/dev/null; fi
# Disable BGM Rydra
sudo systemctl stop bgm > /dev/null 2>&1
sudo systemctl disable bgm > /dev/null 2>&1
# Disable BGM 0fficialPhilcomm
sudo systemctl stop retropie_music > /dev/null 2>&1
sudo systemctl disable retropie_music > /dev/null 2>&1
# Final daemon-reload after Disable 0ther BGMs
sudo systemctl daemon-reload > /dev/null 2>&1
# Remove other stray BGMs
if [ -f "$HOME/BGM.py" ]; then rm -f $HOME/BGM.py; fi
if [ -f "$MUSIC_DIR/BGM.py" ]; then rm -f $MUSIC_DIR/BGM.py; fi

# Make backup of autostart.sh.
if [ -f /opt/retropie/configs/all/autostart.sh ]; then
	cp /opt/retropie/configs/all/autostart.sh /opt/retropie/configs/all/autostart.sh.tamoplus 2>/dev/null         
fi

# Make backups runcommand files.
if [ -f /opt/retropie/configs/all/runcommand-onstart.sh ]; then
	cp /opt/retropie/configs/all/runcommand-onstart.sh /opt/retropie/configs/all/runcommand-onstart.sh.tamoplus 2>/dev/null         
fi

if [  -f /opt/retropie/configs/all/runcommand-onend.sh ]; then
	cp /opt/retropie/configs/all/runcommand-onend.sh /opt/retropie/configs/all/runcommand-onend.sh.tamoplus 2>/dev/null         
fi

if [[ $currentuser == "pi" ]]; then #Use pngview if using Raspberry Pi
	if [ -f "/usr/local/bin/pngview" ]; then echo "Found pngview!"; else
		sudo chmod +x $HOME/tamoplus/pngview
		sudo cp $HOME/tamoplus/pngview /usr/local/bin/
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
sudo cp -f $HOME/tamoplus/Pixel.otf /usr/share/fonts/truetype/
sleep 1
if [ ! -d  "$MUSIC_DIR" ]; then mkdir $MUSIC_DIR; else echo "$MUSIC_DIR Exists!"; fi	

# Will add Default missing EmulationStation settings
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

if [[ $currentuser == "pi" ]]; then #Quick Sinden Lightgun Install
curl -sSL https://raw.githubusercontent.com/SupremePi/supreme-sinden/main/install-lightgun-quick.sh | bash
fi

# Added Supreme Marquee and Script
cd $HOME
git clone https://github.com/SupremePi/PieMarquee2.git
chmod 777 $HOME/PieMarquee2

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
#!/bin/bash
isdual=`tvservice -l |grep "2 attached device" |wc -l`
if [[ $isdual == "1" ]]; then
	fbset -fb /dev/fb0 -g 1920 1080 1920 1080 16
	/usr/bin/python /opt/retropie/configs/all/PieMarquee2/PieMarquee2.py &
fi
EOF12389
		sed -i -f - /opt/retropie/configs/all/autostart.sh < <(sed 's/^/1i/' /tmp/templist-marquee)
	fi
fi
}

setup() {
echo "Add menu options for BGM Overlay Controls"
cp -f $HOME/tamoplus/tamoplus.png $MENU_DIR/icons/
if [ -f "$MENU_DIR/tamoplus.sh" ]; then sudo rm -f $MENU_DIR/tamoplus.sh; fi
if [ -f "$STMENU_DIR_V/tamoplus.sh" ]; then sudo rm -f $STMENU_DIR_V/tamoplus.sh; fi
if [ "$minimum" = "1" ]; then
	sudo chmod +x $INSTALL_DIR/tamoplus-minimum.sh
	sudo chown $currentuser:$currentuser $INSTALL_DIR/tamoplus-minimum.sh
	cp $INSTALL_DIR/tamoplus-minimum.sh $MENU_DIR/tamoplus.sh
	mkdir $MUSIC_DIR/custom
elif [ "$minimum" = "2" ]; then
	sudo chmod +x $INSTALL_DIR/tamoplus-bare.sh
	sudo chown $currentuser:$currentuser $INSTALL_DIR/tamoplus-bare.sh
	cp $INSTALL_DIR/tamoplus-bare.sh $MENU_DIR/tamoplus.sh
	mkdir $MUSIC_DIR/custom
else
	sudo chmod +x $INSTALL_DIR/tamoplus.sh
	sudo chown $currentuser:$currentuser $INSTALL_DIR/tamoplus.sh
	cp $INSTALL_DIR/tamoplus.sh $MENU_DIR/tamoplus.sh
fi

if [ ! -s $MENU_DIR/gamelist.xml ]; then sudo rm -f $MENU_DIR/gamelist.xml; fi
if [ ! -f "$MENU_DIR/gamelist.xml" ]; then cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml $MENU_DIR/gamelist.xml; fi
CONTENT1="\t<game>\n\t\t<path>./tamoplus.sh</path>\n\t\t<name>TAMO+</name>\n\t\t<desc>TAMO+ Theme and Music Overlay Plus, much more. This script changes between Themes and their Background Music. Plus many scripts for themes downloading, visual and audio tools and much, much more.</desc>\n\t\t<image>./icons/tamoplus.png</image>\n\t\t<releasedate>20220422T010251</releasedate>\n\t\t<developer>thepitster, Supreme Team</developer>\n\t\t<publisher>thepitster</publisher>\n\t\t<genre>TAMO+ Script</genre>\n\t</game>"
C1=$(echo $CONTENT1 | sed 's/\//\\\//g')
if grep -q tamoplus.sh "$MENU_DIR/gamelist.xml"; then echo "gamelist.xml entry confirmed"
else
	sed "/<\/gameList>/ s/.*/${C1}\n&/" $MENU_DIR/gamelist.xml > /tmp/temp.xml
	cat /tmp/temp.xml > $MENU_DIR/gamelist.xml
	rm -f /tmp/temp.xml
fi

if [ "$minimum" -lt "2" ]; then
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
fi

# Auto Start Edits for TAMO+
filefound11=`cat /opt/retropie/configs/all/autostart.sh |grep tamoplus |wc -l`
if [[ ${filefound11} > 0 ]]; then

   echo -e "$(tput setaf 2)Tamo+ Script Already Found in Auto Start But Will Now Enable! $(tput sgr0)"
   echo "already in autostart.sh" > /tmp/exists

else

	filefound88=`cat /opt/retropie/configs/all/autostart.sh |grep mpg123 |wc -l`
	if [[ ${filefound88} > 0 ]]; then

		echo -e "$(tput setaf 2)Found An Old Version Of Mpg123 Installed Removing It For Tamo+ Installation $(tput sgr0)"
		sleep 3      
		sed -i '/^while pgrep omxplayer/d' $AUTOSTART
		sed -i '/^#while pgrep omxplayer/d' $AUTOSTART
		sed -i '/^(sleep 10; mpg123/d' $AUTOSTART
		sed -i '/^#(sleep 10; mpg123/d' $AUTOSTART

cat <<\EOF123 > "/tmp/templist"
(nohup python /home/pi/tamoplus/BGM.py > /dev/null 2>&1) &
EOF123
		sed -i -f - /opt/retropie/configs/all/autostart.sh < <(sed 's/^/1i/' /tmp/templist)
		if [ "$minimum" = "2" ]; then
			sed -i -e '$apgrep -f "BGM.py" |xargs sudo kill -9 > /dev/null 2>&1 &\npgrep -f pngview|xargs sudo kill -9 > /dev/null 2>&1 &' $AUTOSTART
		else
			sed -i -e '$a/opt/retropie/configs/all/emulationstation/scripts/shutdown/exit-splash\npgrep -f "BGM.py" |xargs sudo kill -9 > /dev/null 2>&1 &\npgrep -f pngview|xargs sudo kill -9 > /dev/null 2>&1 &' $AUTOSTART
		fi
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
		if [ "$minimum" = "2" ]; then
			sed -i -e '$apgrep -f "BGM.py" |xargs sudo kill -9 > /dev/null 2>&1 &\npgrep -f pngview|xargs sudo kill -9 > /dev/null 2>&1 &' $AUTOSTART
		else
			sed -i -e '$a/opt/retropie/configs/all/emulationstation/scripts/shutdown/exit-splash\npgrep -f "BGM.py" |xargs sudo kill -9 > /dev/null 2>&1 &\npgrep -f pngview|xargs sudo kill -9 > /dev/null 2>&1 &' $AUTOSTART
		fi
		echo -e "$(tput setaf 2)Done! $(tput sgr0)"
		sleep 3
		clear
	fi
fi

filefound21=`cat /opt/retropie/configs/all//autostart.sh |grep "/bin/bash" |wc -l`
if [[ ${filefound21} > 0 ]]; then echo "Shebang already in autostart.sh" > /tmp/exists
else sed -i '1i #!/bin/bash' $AUTOSTART; fi

# Runcommand On Start Edits for TAMO+
if [ ! -f /opt/retropie/configs/all/runcommand-onstart.sh ]; then
	echo "$(tput setaf 2)Creating Runcommand On Start $(tput sgr0)" > /tmp/exists
	echo '' > /opt/retropie/configs/all/runcommand-onstart.sh
	sudo chmod +x /opt/retropie/configs/all/runcommand-onstart.sh
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
	echo  " $(tput sgr2)Runcommand On Start Created! $(tput sgr0)"
fi

if [ "$minimum" -lt "2" ]; then
	filefound4=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep videoloadingscreens= |wc -l`
	if [[ ${filefound4} > 0 ]]; then sed -i '/pkill -STOP mpg123/d' $RUNONSTART; fi
fi
filefound2=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep mpg123 |wc -l`
if [[ ${filefound2} > 0 ]]; then sed -i '/pkill -STOP mpg123/d' $RUNONSTART; fi

filefound51=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep BGM_vol_fade.sh |wc -l`
if [[ ${filefound51} > 0 ]]; then sed -i '/home\/pi\/BGM_vol_fade.sh -stop/d' $RUNONSTART
	if grep -q 'omxplayer' "$RUNONSTART"; then
		sed -i 's/omxplayer "$default" > \/dev\/null 2>\&1/omxplayer "$default" > \/dev\/null 2>\&1\nfi/g' $RUNONSTART; sleep 1
		sed -i '1i #!/bin/sh' $RUNONSTART
		sed -i '2i ### Begin VideoLoading Screens Function' $RUNONSTART
		sed -i '3i enablevideolaunch="true"' $RUNONSTART
		sed -i '4i videoloadingscreens="/home/pi/RetroPie/videoloadingscreens/jarvis"' $RUNONSTART
		sed -i '5i if [[ $enablevideolaunch == "true" ]]; then' $RUNONSTART
		sed -i '23i ### End VideoLoading Screens Function' $RUNONSTART
		sed -i 's/$HOME\/RetroPie\/videoloadingscreens/$videoloadingscreens/g' $RUNONSTART
		sed -i 's/omxplayer/omxplayer --vol 250 --amp 250 -b/g' $RUNONSTART
	fi
fi

ifexist2=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep "vlc --no-loop --play-and-exit --no-video-title-show" |wc -l`
if [[ ${ifexist2} > 0 ]]; then
	echo -e "$(tput setaf 2)Now Editing Runcommand On Start And Enabling Tamo+! $(tput sgr0)"
	sed -i '6i videoloadingscreens="/home/pi/RetroPie/videoloadingscreens/jarvis"' $RUNONSTART
	sed -i 's/vlc --no-loop --play-and-exit --no-video-title-show/omxplayer --vol 250 --amp 250 -b/g' $RUNONSTART
	sed -i 's/$HOME\/RetroPie\/videoloadingscreens/$videoloadingscreens/g' $RUNONSTART
fi

filefound31=`cat /opt/retropie/configs/all//runcommand-onstart.sh |grep "/bin/bash" |wc -l`
if [[ ${filefound31} > 0 ]]; then echo "Shebang already in runcommand-onstart.sh" > /tmp/exists
else sed -i '1i #!/bin/bash' $RUNONSTART; fi

# Runcommand On End Edits for TAMO+
if [ ! -f /opt/retropie/configs/all/runcommand-onend.sh ]; then
	echo '' > /opt/retropie/configs/all/runcommand-onend.sh
	sudo chmod +x /opt/retropie/configs/all/runcommand-onend.sh
	cat <<\EOF12345 > "/tmp/templist3"
#! /bin/bash
# /etc/init.d/start-sound
sudo omxplayer --vol 250 --amp 250 -b /home/pi/RetroPie/splashscreens/ThanksForPlaying.mp4 > /dev/null 2>&1
EOF12345
	sed -i -f - /opt/retropie/configs/all/runcommand-onend.sh < <(sed 's/^/1i/' /tmp/templist3)
fi

filefound3=`cat /opt/retropie/configs/all/runcommand-onend.sh |grep "pkill -CONT mpg123" |wc -l`
if [[ ${filefound3} > 0 ]]; then
	sed -i '/pkill -CONT mpg123/d' $RUNONEND
	sed -i '/#pkill -CONT mpg123/d' $RUNONEND
	sed -i '/#(sleep 2 && \/home\/pi\/BGM_vol_fade.sh.1 -cont) &/d' $RUNONEND
	sed -i '/(sleep 2 && \/home\/pi\/BGM_vol_fade.sh.1 -cont) &/d' $RUNONEND
	sed -i '/(sleep 2 && home\/pi\/BGM_vol_fade.sh.1 -cont) &/d' $RUNONEND
	sed -i '/#(sleep 2 && home\/pi\/BGM_vol_fade.sh.1 -cont) &/d' $RUNONEND
	sleep 1
		cat <<\EOF12345 > "/tmp/templist3"
#! /bin/bash
# /etc/init.d/start-sound
sudo omxplayer --vol 250 --amp 250 -b /home/pi/RetroPie/splashscreens/ThanksForPlaying.mp4 > /dev/null 2>&1
EOF12345
	sed -i -f - /opt/retropie/configs/all/runcommand-onend.sh < <(sed 's/^/1i/' /tmp/templist3)

fi

ifexist3=`cat /opt/retropie/configs/all/runcommand-onend.sh |grep "omxplayer --vol 250 --amp 250 -b" |wc -l`
if [[ ${ifexist3} > 0 ]]; then
	echo -e "$(tput setaf 2)Tamo+ Script Already Found In Runcommand! $(tput sgr0)"
	echo "already in runcommand-onend.sh" > /tmp/exists
fi

filefound41=`cat /opt/retropie/configs/all//runcommand-onend.sh |grep "/bin/bash" |wc -l`
if [[ ${filefound41} > 0 ]]; then echo "Shebang already in runcommand-onend.sh" > /tmp/exists
else sed -i '1i #!/bin/bash' $RUNONEND; fi

echo -e "$(tput setaf 2)Done! $(tput sgr0)"
sleep 3
clear
if [ "$minimum" -lt "2" ]; then
	CUR_THM=$(grep "<string name=\"ThemeSet\"" "$ES_SETTINGS"|awk '{print $3}')
	NEW_THM="value=\"carbonite\""
	if [ $CUR_THM == $NEW_THM ]; then echo "Theme already set!"; else sed -i -E "s|${CUR_THM}|${NEW_THM}|g" $ES_SETTINGS; fi
	sudo sed -i -E "s/.*/\/home\/pi\/RetroPie\/splashscreens\/JarvisSplash.mp4/" /etc/splashscreen.list
fi
cd $HOME
}

install_ending() {
# Explain stuff to the user
ending=""
ending="${ending}TAMO+ and is now installed.\n"
ending="${ending}Run $MENU_DIR/tamoplus.sh or navigate to:\n"
if [ -d "$STMENU_DIR_V" ]; then ending="${ending}Retropie > Visualtools > TAMO+, for more options!\n"; else ending="${ending}Retropie > TAMO+, for more options!\n"; fi
ending="${ending}BGM has also been set up to run automatically when the device boots!\n"
ending="${ending}Thanks for trying out TAMO+\n\n"
dialog --backtitle "TAMO+ Install Script $ver" \
	--title "TAMO+ Install Script $ver" \
	--msgbox "${ending}" 35 110

rebootq
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
             *) break ;;
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
