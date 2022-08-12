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
PSUTIL_PKG="omxplayer python-pygame mpg123 imagemagick python-urllib3 libjpeg8 libpng12-0 fbi python-pip python3-pip python3-psutil wiringpi mono-complete v4l-utils libsdl1.2-dev libsdl-image1.2-dev libjpeg-dev"
installset=0

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
infobox="${infobox}\"halloweenspecial\" (Halloween), \"merryxmas\" (Christmas), \"strangerthings\" (Stranger Things), and\n"
infobox="${infobox}\"devilchromey\" (Diablos Arcade). This includes themes, music, splashscreens, and game videoloadingscreens.\n"
infobox="${infobox}Also you have \"arcade\" (Arcade), \"st\" (Supreme Team), \"uvf\"\n"
infobox="${infobox}(Ultimate Vs Fighter), \"venom\" (Venom), \"pistolero\" (Pistolero),  and this last one\n"
infobox="${infobox}\"custom\" (Custom) is for placing your own MP3 files into.\n"
infobox="${infobox}Also included in this script is the ability to select between the different music folders you can disable\n"
infobox="${infobox}them all or enable them, but only one at a time, the music will then automatically start playing.\n"
infobox="${infobox}Launch a game, the music will stop. Upon exiting out of the game the music will begin playing again.\n"
infobox="${infobox}You can now choose to install themesets and music later after install.\n"
infobox="${infobox}This also lets you turn off certain options for BGM.py such as, Enable/Disable the Overlay, Fadeout effect,\n"
infobox="${infobox}Rounded Corners on Overlays, an option to turn the dashes, or hyphens, with a space on both sides\n"
infobox="${infobox}\" - \"\n"
infobox="${infobox}and separate the song title to a separate new lines.\n"
infobox="${infobox}\n"
infobox="${infobox}Overlay disappeared when you change resolutions? Set postion to Top-Left so you can see\n"
infobox="${infobox}it then set it to desired postition, compatible with all resolutions.\n\n"
infobox="${infobox}_______________________________________________________\n\n"
dialog --backtitle "TAMO+ Install Script $ver" --title "TAMO+ Install Script $ver" --msgbox "${infobox}" 35 110

tamo_install_menu() {
    local choice
    while true; do
        choice=$(dialog --backtitle "TAMO+ Install Script $ver" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose An Option Below" 25 85 20 \
            01 "Bare Install No Themes or Music Just Tools (Can Always Install Later)" \
            02 "Minimal Install Themesets No Extra Music (Can Always Install Later)" \
            03 "Full Install Themesets No Custom Music (Can Always Install Later)" \
            04 "Full Install Themesets And All Music (Everything Included)" \
            2>&1 > /dev/tty)
        case "$choice" in
            01) installset=1; install_tamoplus ;;
            02) installset=2; install_tamoplus ;;
            03) installset=3; install_tamoplus ;;
            04) installset=4; install_tamoplus ;;
             *) break ;;
        esac
    done
}

install_tamoplus() {
if [ -d "$HOME/.tamoplus" ]; then echo "Found .tamoplus folder"; else mkdir $HOME/.tamoplus; fi
clear
prep_work
echo "Prep Work All Done. Downloading Music"

if [ $installset -eq "1" ]; then
	if [ ! -f "$SPL_DIR/ThanksForPlaying.mp4" ]; then wget "${RAW_HOST1}"/splashscreens/ThanksForPlaying.mp4 -P "$SPL_DIR"; fi
	if [ ! -f "$SPL_DIR/JarvisSplash.mp4" ]; then wget"${RAW_HOST1}"/splashscreens/JarvisSplash.mp4 -P "$SPL_DIR"; fi
	if [ ! -f "$EXT_SPL_DIR/JarvisExit.mp4" ]; then wget "${RAW_HOST1}"/splashscreens/exitscreens/JarvisExit.mp4 -P "$EXT_SPL_DIR"; fi
fi

if [ $installset -le "2" ]; then
	if [ ! -d "$MUSIC_DIR/custom" ]; then mkdir $MUSIC_DIR/custom/; fi
	cp -f "$INSTALL_DIR/files/BGM Folder Disabled.mp3" "$MUSIC_DIR/custom/No Music in Folder.mp3"
fi

if [ $installset -ge "2" ]; then 
	download_themes
	echo "Themes All Done."
	download_thememusic
	echo "Theme Music All Done."
	download_videos
	echo "Videos All Done."
	sed -i "s|themeset_carbonite=0|themeset_carbonite=1|" "$USER_SETTINGS"
	sed -i "s|themeset_devilchromey=0|themeset_devilchromey=1|" "$USER_SETTINGS"
	sed -i "s|themeset_halloweenspecial=0|themeset_halloweenspecial=1|" "$USER_SETTINGS"
	sed -i "s|themeset_neonibad=0|themeset_neonibad=1|" "$USER_SETTINGS"
	sed -i "s|themeset_pistolero=0|themeset_pistolero=1|" "$USER_SETTINGS"
	sed -i "s|themeset_pleasureparadise=0|themeset_pleasureparadise=1|" "$USER_SETTINGS"
	sed -i "s|themeset_strangerthings=0|themeset_strangerthings=1|" "$USER_SETTINGS"
	sed -i "s|themeset_supremeteam=0|themeset_supremeteam=1|" "$USER_SETTINGS"
	sed -i "s|themeset_merryxmas=0|themeset_merryxmas=1|" "$USER_SETTINGS"
fi

if [ $installset -ge "3" ]; then download_bgmusic; echo "Background Music All Done."; fi

if [ $installset -eq "4" ]; then download_custommusic; echo "Custom Music All Done."; fi

setup
post_update
install_ending
exit
}

download_themes() {
if [ ! -d $THEMES_DIR ]; then mkdir $THEMES_DIR; fi
# Downloading Themes
echo "Downloading themes needed for TAMO+"
if [ ! -d  "$THEMES_DIR/carbonite" ]; then git clone "https://github.com/ALLRiPPED/es-theme-carbonite.git" "$THEMES_DIR/carbonite"
else cd $THEMES_DIR/carbonite; git reset --hard; git pull; fi
if [ ! -d  "$THEMES_DIR/halloweenspecial" ]; then git clone "https://github.com/ALLRiPPED/es-theme-halloweenspecial.git" "$THEMES_DIR/halloweenspecial"
else cd $THEMES_DIR/halloweenspecial; git reset --hard; git pull; fi
if [ ! -d  "$THEMES_DIR/devilchromey" ]; then git clone "https://github.com/ALLRiPPED/es-theme-devilchromey.git" "$THEMES_DIR/devilchromey"
else cd $THEMES_DIR/devilchromey; git reset --hard; git pull; fi
if [ ! -d  "$THEMES_DIR/neonibad" ]; then git clone "https://github.com/ALLRiPPED/es-theme-neonibad.git" "$THEMES_DIR/neonibad"
else cd $THEMES_DIR/neonibad; git reset --hard; git pull; fi
if [ ! -d  "$THEMES_DIR/pistolero" ]; then git clone "https://github.com/ALLRiPPED/es-theme-pistolero.git" "$THEMES_DIR/pistolero"
else cd $THEMES_DIR/pistolero; git reset --hard; git pull; fi
if [ ! -d  "$THEMES_DIR/pleasureparadise" ]; then git clone "https://github.com/ALLRiPPED/es-theme-pleasureparadise.git" "$THEMES_DIR/pleasureparadise"
else cd $THEMES_DIR/pleasureparadise; git reset --hard; git pull; fi
if [ ! -d  "$THEMES_DIR/strangerstuff" ]; then git clone "https://github.com/ALLRiPPED/es-theme-strangerthings.git" "$THEMES_DIR/strangerthings"
else cd $THEMES_DIR/strangerstuff; git reset --hard; git pull; fi
if [ ! -d  "$THEMES_DIR/supremeteam" ]; then git clone "https://github.com/ALLRiPPED/es-theme-supremeteam.git" "$THEMES_DIR/supremeteam"
else cd $THEMES_DIR/supremeteam; git reset --hard; git pull; fi
if [ ! -d  "$THEMES_DIR/merryxmas" ]; then git clone "https://github.com/ALLRiPPED/es-theme-merryxmas.git" "$THEMES_DIR/merryxmas"
else cd $THEMES_DIR/merryxmas; git reset --hard; git pull; fi
}

download_videos() {
echo -e "$(tput setaf 2)Done! $(tput sgr0)"
sleep 1
if [ -f "$SPL_DIR/Pistelero.mp4" ] && [ -f "$SPL_DIR/PleasureParadise.mp4" ] && [ -f "$SPL_DIR/RetroDevilReaper.mp4" ] && [ -f "$SPL_DIR/Supreme.mp4" ]
then echo "Splash, Exit, and Game Launching Screens Found!"
else
	if [ -f "$INSTALL_DIR/tamoplus-screens.zip" ]; then echo "Extracting Splash, Exit, and Game Launching Screens"; unzip -uq $INSTALL_DIR/tamoplus-screens.zip -d $HOME/RetroPie
		echo "Splash, Exit, and Game Launching Screens Extracting Complete"
	else
		echo "Downloading Splash, Exit, and Game Launching Screens"
		gdown "${GOOG_HOST}"/uc?id=1002ccXpBnKgrSBT8lD-nbU9xGHY2emVE -O $INSTALL_DIR/tamoplus-screens.zip
		echo "Downloading Complete, Now Extracting Splash, Exit, and Game Launching Screens"
		unzip -uq $INSTALL_DIR/tamoplus-screens.zip -d $HOME/RetroPie; echo "Splash, Exit, and Game Launching Screens Extracting Complete"
	fi
fi
if [ ! -f "$SPL_DIR/ThanksForPlayingiBAD.mp4" ]; then wget "${RAW_HOST1}"/splashscreens/ThanksForPlayingiBAD.mp4 -P "$SPL_DIR"; fi
move_exitscreens
}

download_thememusic() {
if [ -f "$MUSIC_DIR/halloweenspecial/1.mp3" ] && [ -f "$MUSIC_DIR/strangerthings/01. Stranger Things.mp3" ] && [ -f "$MUSIC_DIR/merryxmas/Sleigh Ride.mp3" ]
then echo "Theme Music Found!"
else
	if [ -f "$INSTALL_DIR/thememusic.zip" ]; then echo "Extracting Theme Music"; unzip -uq $INSTALL_DIR/thememusic.zip -d $HOME/RetroPie
		echo "Theme Music Extracting Complete"
	else
		echo "Downloading Theme Music"
		gdown "${GOOG_HOST}"/uc?id=1-Gctmc_AAp-MMOr265vZfjfTijLUN_6M -O $INSTALL_DIR/thememusic.zip
		echo "Downloading Complete, Now Extracting Theme Music"
		unzip -uq $INSTALL_DIR/thememusic.zip -d $HOME/RetroPie; echo "Theme Music Extracting Complete"
	fi
fi
}

download_bgmusic() {
if [ -f "$MUSIC_DIR/arcade/arcade81.mp3" ]; then echo "BGM Found Music!"; else
	if [ -f "$INSTALL_DIR/bgm.zip" ]; then echo "Extracting BGM Music"; unzip -uq $INSTALL_DIR/bgm.zip -d $HOME/RetroPie
		echo "BGM Music Extraction Complete"
	else
		echo "Downloading BGM Music"
		gdown "${GOOG_HOST}"/uc?id=1-GLqdCNpH0i3zKRAJDOWwxfaP2gVGaC4 -O $INSTALL_DIR/bgm.zip
		echo "Downloading Complete, Now Extracting BGM Music"
		unzip -uq $INSTALL_DIR/bgm.zip -d $HOME/RetroPie; echo "BGM Music Extracting Complete"
	fi
fi
}

download_custommusic() {
if [ -f "$MUSIC_DIR/custom/3 Inches Of Blood- Deadly Sinners.mp3" ]; then echo "Custom Found Music!"; else
	if [ -f "$INSTALL_DIR/custombgm.zip" ]; then echo "Extracting CustomBGM Music"; unzip -uq $INSTALL_DIR/custombgm.zip -d $HOME/RetroPie
		rm -f $MUSIC_DIR/custom/'No Music in Folder.mp3'
		echo "CustomBGM Music Extracting Complete"
	else
		echo "Downloading CustomBGM Music"
		gdown "${GOOG_HOST}"/uc?id=1-BHwb4oT6GiwpRv7l3VLHuJLsRxScGNV -O $INSTALL_DIR/custombgm.zip
		echo "Downloading Complete, Now Extracting CustomBGM Music"
		unzip -uq $INSTALL_DIR/custombgm.zip -d $HOME/RetroPie
		rm -f $MUSIC_DIR/custom/'No Music in Folder.mp3'
		echo "CustomBGM Music Extraction Complete"
	fi
fi
}

prep_work() {
# Moving Exitscreens To New Location
move_exitscreens

chmod 0755 /home/pi/tamoplus/scripts/*
chmod 0755 /home/pi/tamoplus/files/*.sh
chmod 0755 /home/pi/tamoplus/files/pngview
chmod 0755 /home/pi/tamoplus/files/*.py
sudo chown pi:pi $MENU_DIR/*

check_for_usersettings

cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist_bak.xml

if dialog --stdout --title "What to do?" \
          --backtitle "Setup ReroPie Folder Menus?" \
          --yesno "Yes: Folder Menus, No: Stock Menu" 7 60; then
    dialog --title "Folder Menus Now Set To ON. Setting up Folder Menus" --msgbox "TRUE" 6 44
	sed -i "s|user_menu_flag=0|user_menu_flag=1|" "$USER_SETTINGS"
	#---------------------------------------------------------------------
	#ADD ALL ICONS AND THE FULL GAMELIST FOR EASY RSYNC EVEN WHEN REMOVING
	#---------------------------------------------------------------------
	rsync -av $INSTALL_DIR/scripts/icons/ $MENU_DIR/icons/
	game_list_full
	keep_menus
else
    dialog --title "Folder Menus Now Set To Off. Resetting back to RetroPie Stock Menu." --msgbox "FALSE" 6 44
	sed -i "s|user_menu_flag=1|user_menu_flag=0|" "$USER_SETTINGS"
	#---------------------------------------------------------------------
	#ADD ALL ICONS AND THE FULL GAMELIST FOR EASY RSYNC EVEN WHEN REMOVING
	#---------------------------------------------------------------------
	rsync -av $INSTALL_DIR/scripts/icons/ $MENU_DIR/icons/
	game_list_full
	rm_menus
fi

if [ ! -d "$HOME/RetroPie/videoloadingscreens/default" ]; then mkdir $HOME/RetroPie/videoloadingscreens/default/; fi
echo "Setting up Splash, Exit, and Game Launching Screens"
if [ -f "$HOME/RetroPie/videoloadingscreens/default.mp4" ]; then echo "Default Launch Screen Found Moving to default folder"
	mv -f /home/pi/RetroPie/videoloadingscreens/* /home/pi/RetroPie/videoloadingscreens/default/ > /dev/null 2>&1
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
git clone https://github.com/WiringPi/WiringPi
cd $HOME/WiringPi
sh build
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
		sudo chmod +x $INSTALL_DIR/files/pngview
		sudo cp $INSTALL_DIR/files/pngview /usr/local/bin/
	fi
elif [[ $currentuser == "pigaming" ]]; then
	sudo apt-get install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev # Install ODROID stuff
	git clone https://github.com/AreaScout/Gaming-Kit-Tools.git
	cd $INSTALL_DIR/Gaming-Kit-Tools
	make
	sudo make install
fi

cd $INSTALL_DIR/
sudo cp -f $INSTALL_DIR/files/GROBOLD.ttf /usr/share/fonts/truetype/
sudo cp -f $INSTALL_DIR/files/Pixel.otf /usr/share/fonts/truetype/
cp -f $INSTALL_DIR/files/*.py $SETTINGS_DIR
chmod +x $SETTINGS_DIR/*.py
cp -f $INSTALL_DIR/files/*.mp3 $SETTINGS_DIR
sleep 1
if [ ! -d "$MUSIC_DIR" ]; then mkdir $MUSIC_DIR; else echo "$MUSIC_DIR Exists!"; fi	

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
<int name="MaxVRAM" value="220" />
<int name="ScraperResizeHeight" value="0" />
<int name="ScraperResizeWidth" value="400" />
<int name="ScreenSaverSwapImageTimeout" value="10000" />
<int name="ScreenSaverSwapVideoTimeout" value="30000" />
<int name="ScreenSaverTime" value="300000" />
<int name="SubtitleSize" value="55" />
<int name="SystemSleepTime" value="0" />
<string name="AudioCard" value="sysdefault" />
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
<string name="TransitionStyle" value="fade" />
<string name="UIMode" value="Full" />
<string name="UIMode_passkey" value="uuddlrlrba" />
EOF15293
sudo chmod +x /opt/retropie/configs/all/emulationstation/es_settings.cfg

if [[ $currentuser == "pi" ]]; then #Quick Sinden Lightgun Install
curl -sSL https://raw.githubusercontent.com/SupremePi/supreme-sinden/main/install-lightgun-quick.sh | bash
cp -f $MENU_DIR/sinden-menu.sh $INSTALL_DIR/scripts/sinden-menu.sh
chmod 755 $INSTALL_DIR/scripts/sinden-menu.sh
fi

# Added Supreme Marquee and Script
cd $HOME
git clone https://github.com/SupremePi/PieMarquee2.git
chmod 777 $HOME/PieMarquee2

sudo rm -rf /opt/retropie/configs/all/PieMarquee2/
mkdir /opt/retropie/configs/all/PieMarquee2/
cp -f -r $HOME/PieMarquee2/PieMarquee2 /opt/retropie/configs/all/

if [ -f "/home/pi/PieMarquee2/scripts/supreme-marquee-tool.sh" ]; then sudo cp -f /home/pi/PieMarquee2/scripts/supreme-marquee-tool.sh $INSTALL_DIR/scripts/; fi
sudo cp -f $HOME/PieMarquee2/scripts/asplashscreen.sh /opt/retropie/supplementary/splashscreen/

chmod 755 /opt/retropie/configs/all/PieMarquee2/omxiv-marquee
chmod 755 $INSTALL_DIR/scripts/supreme-marquee-tool.sh
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
if [ -d "/home/pi/RetroPie/scripts/.sb-unified" ]; then cp -f $INSTALL_DIR/files/tamoplus-sbu.png $MENU_DIR/icons/tamoplus.png
elif [ -d "$THEMES_DIR/devil chromey" ]; then cp -f $INSTALL_DIR/files/tamoplus-dev.png $MENU_DIR/icons/tamoplus.png
else cp -f $INSTALL_DIR/files/tamoplus-rp.png $MENU_DIR/icons/tamoplus.png; fi

if [ -f "$MENU_DIR/tamoplus.sh" ]; then sudo rm -f $MENU_DIR/tamoplus.sh; fi
if [ -f "$STMENU_DIR_V/tamoplus.sh" ]; then sudo rm -f $STMENU_DIR_V/tamoplus.sh; fi
sudo chmod +x $INSTALL_DIR/tamoplus.sh
sudo chown $currentuser:$currentuser $INSTALL_DIR/tamoplus.sh
cp $INSTALL_DIR/files/tamoplus.sh $MENU_DIR/tamoplus.sh

if [ ! -s $MENU_DIR/gamelist.xml ]; then sudo rm -f $MENU_DIR/gamelist.xml; fi
if [ ! -f "$MENU_DIR/gamelist.xml" ]; then cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml $MENU_DIR/gamelist.xml; fi

if grep -q tamoplus.sh "$MENU_DIR/gamelist.xml"; then echo "gamelist.xml entry confirmed"
else
	sed "/<\/gameList>/ s/.*/${TC1}\n&/" $MENU_DIR/gamelist.xml > /tmp/temp1.xml
	cat /tmp/temp1.xml > $MENU_DIR/gamelist.xml
	rm -f /tmp/temp1.xml
fi

## Detecting Retro-Devils Devils-Box
db_detect

if [ ! -d  "/opt/retropie/configs/all/emulationstation/scripts/reboot" ]; then
	mkdir -p /opt/retropie/configs/all/emulationstation/scripts/reboot
	cat <<\EOF1293 > "/opt/retropie/configs/all/emulationstation/scripts/reboot/exit-splash"
#! /bin/bash
# /etc/init.d/start-sound

omxplayer --vol 250 --amp 250 -b /home/pi/RetroPie/splashscreens/exitscreens/JarvisExit.mp4 > /dev/null 2>&1
pkill -f -CONT BGM.py
EOF1293
	sudo chmod +x /opt/retropie/configs/all/emulationstation/scripts/reboot/exit-splash
fi

if [ ! -d  "/opt/retropie/configs/all/emulationstation/scripts/shutdown" ]; then
	mkdir -p /opt/retropie/configs/all/emulationstation/scripts/shutdown
	cat <<\EOF18293 > "/opt/retropie/configs/all/emulationstation/scripts/shutdown/exit-splash"
#! /bin/bash
# /etc/init.d/start-sound

omxplayer --vol 250 --amp 250 -b /home/pi/RetroPie/splashscreens/exitscreens/JarvisExit.mp4 > /dev/null 2>&1
EOF18293
	sudo chmod +x /opt/retropie/configs/all/emulationstation/scripts/shutdown/exit-splash
fi

# Auto Start Edits for TAMO+
filefound11=`cat /opt/retropie/configs/all/autostart.sh |grep tamoplus |wc -l`
if [[ ${filefound11} > 0 ]]; then

   echo -e "$(tput setaf 2)Tamo+ Script Already Found in Auto Start But Will Now Enable! $(tput sgr0)"
   echo "already in autostart.sh" > /tmp/exists
   sed -i 's/home\/pi\/tamoplus\/BGM.py/home\/pi\/.tamoplus\/BGM.py/g' $AUTOSTART

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
(nohup python /home/pi/.tamoplus/BGM.py > /dev/null 2>&1) &
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
(nohup python /home/pi/.tamoplus/BGM.py > /dev/null 2>&1) &
EOF123
		sed -i -f - /opt/retropie/configs/all/autostart.sh < <(sed 's/^/1i/' /tmp/templist)
		sed -i -e '$a/opt/retropie/configs/all/emulationstation/scripts/shutdown/exit-splash\npgrep -f "BGM.py" |xargs sudo kill -9 > /dev/null 2>&1 &\npgrep -f pngview|xargs sudo kill -9 > /dev/null 2>&1 &' $AUTOSTART
		echo -e "$(tput setaf 2)Done! $(tput sgr0)"
		sleep 3
		clear
	fi
fi

filefound21=`cat /opt/retropie/configs/all/autostart.sh |grep "/bin/bash" |wc -l`
if [[ ${filefound21} > 0 ]]; then echo "Shebang already in autostart.sh" > /tmp/exists
else sed -i '1i #!/bin/bash' $AUTOSTART; fi

# Runcommand On Start Edits for TAMO+
if [ ! -s /opt/retropie/configs/all/runcommand-onstart.sh ]; then
	sudo rm -f /opt/retropie/configs/all/runcommand-onstart.sh
fi
	
if [ ! -f /opt/retropie/configs/all/runcommand-onstart.sh ]; then
	echo "$(tput setaf 2)Creating Runcommand On Start $(tput sgr0)" > /tmp/exists
	cat <<\EOF1234 > "/tmp/templist2"
#!/bin/sh
### Begin VideoLoading Screens Function
enablevideolaunch="true"
videoloadingscreens="/home/pi/RetroPie/videoloadingscreens/default"
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
pkill -f -STOP BGM.py
pgrep -f pngview | xargs sudo kill -9 > /dev/null 2>&1
EOF1234
	sed -i -f - /opt/retropie/configs/all/runcommand-onstart.sh < <(sed 's/^/1i/' /tmp/templist2)
	sudo chmod +x /opt/retropie/configs/all/runcommand-onstart.sh
	echo  " $(tput sgr2)Runcommand On Start Created! $(tput sgr0)"
fi

filefound4=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep videoloadingscreens= |wc -l`
if [[ ${filefound4} > 0 ]]; then sed -i '/pkill -STOP mpg123/d' $RUNONSTART; fi

filefound2=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep mpg123 |wc -l`
if [[ ${filefound2} > 0 ]]; then sed -i '/pkill -STOP mpg123/d' $RUNONSTART; fi

filefound51=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep BGM_vol_fade.sh |wc -l`
if [[ ${filefound51} > 0 ]]; then sed -i '/home\/pi\/BGM_vol_fade.sh -stop/d' $RUNONSTART
	if grep -q 'omxplayer' "$RUNONSTART"; then
		sed -i 's/omxplayer "$default" > \/dev\/null 2>\&1/omxplayer "$default" > \/dev\/null 2>\&1\nfi; fi/g' $RUNONSTART; sleep 1
		sed -i '1i #!/bin/sh' $RUNONSTART
		sed -i '2i ### Begin VideoLoading Screens Function' $RUNONSTART
		sed -i '3i enablevideolaunch="true"' $RUNONSTART
		sed -i '4i videoloadingscreens="/home/pi/RetroPie/videoloadingscreens/default/"' $RUNONSTART
		sed -i '5i if [[ $enablevideolaunch == "true" ]]; then' $RUNONSTART
		sed -i '23i ### End VideoLoading Screens Function' $RUNONSTART
		sed -i 's/$HOME\/RetroPie\/videoloadingscreens/$videoloadingscreens/g' $RUNONSTART
		sed -i 's/omxplayer/omxplayer --vol 250 --amp 250 -b/g' $RUNONSTART
	fi
fi

ifexist2=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep "vlc --no-loop --play-and-exit --no-video-title-show" |wc -l`
if [[ ${ifexist2} > 0 ]]; then
	echo -e "$(tput setaf 2)Now Editing Runcommand On Start And Enabling Tamo+! $(tput sgr0)"
	sed -i '6i videoloadingscreens="/home/pi/RetroPie/videoloadingscreens/default/"' $RUNONSTART
	sed -i 's/vlc --no-loop --play-and-exit --no-video-title-show/omxplayer --vol 250 --amp 250 -b/g' $RUNONSTART
	sed -i 's/$HOME\/RetroPie\/videoloadingscreens/$videoloadingscreens/g' $RUNONSTART
fi

filefound31=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep "/bin/bash" |wc -l`
if [[ ${filefound31} > 0 ]]; then echo "Shebang already in runcommand-onstart.sh" > /tmp/exists
else sed -i '1i #!/bin/bash' $RUNONSTART; fi

filefound91=`cat /opt/retropie/configs/all/runcommand-onstart.sh |grep "pkill -f -CONT BGM.py" |wc -l`
if [[ ${filefound91} > 0 ]]; then echo "$(tput setaf 2)Tamo+ Script Already Found In Runcommand-OnEnd! $(tput sgr0)"
else
	if ! grep 'pkill -f -STOP BGM.py' "$RUNONSTART" > /dev/null 2>&1; then sed -i -e '$apkill -f -STOP BGM.py' "$RUNONSTART" > /dev/null 2>&1; fi
	if ! grep 'pgrep -f pngview | xargs sudo kill -9 > /dev/null 2>&1' "$RUNONSTART" > /dev/null 2>&1; then sed -i -e '$apgrep -f pngview | xargs sudo kill -9 > /dev/null 2>&1' "$RUNONSTART" > /dev/null 2>&1; fi
fi

#Fix autostart.sh carbonite
CUR_LOD=$(grep "videoloadingscreens=" "$RUNONSTART"|grep -o '".*"')
NEW_LOD='"/home/pi/RetroPie/videoloadingscreens/default"'
if [[ $CUR_LOD == $NEW_LOD ]]; then echo "Videoloadingscreens already set!"; else sed -i -E "s|videoloadingscreens=${CUR_LOD}|videoloadingscreens=${NEW_LOD}|g" $RUNONSTART; fi

# Runcommand On End Edits for TAMO+
if [ ! -s /opt/retropie/configs/all/runcommand-onend.sh ]; then
	sudo rm -f /opt/retropie/configs/all/runcommand-onend.sh
fi	

if [ ! -f /opt/retropie/configs/all/runcommand-onend.sh ]; then
	cat <<\EOF12345 > "/tmp/templist3"
#!/bin/bash
#/etc/init.d/start-sound
enableexitvideo="true"
videoexitingscreens="/home/pi/RetroPie/splashscreens"
if [[ $enableexitvideo == "true" ]]; then
sudo omxplayer --vol 250 --amp 250 -b $videoexitingscreens/ThanksForPlaying.mp4 > /dev/null 2>&1
fi
pkill -f -CONT BGM.py
EOF12345
	sed -i -f - /opt/retropie/configs/all/runcommand-onend.sh < <(sed 's/^/1i/' /tmp/templist3)
	sudo chmod +x /opt/retropie/configs/all/runcommand-onend.sh
fi

filefound3=`cat /opt/retropie/configs/all/runcommand-onend.sh |grep "pkill -CONT mpg123" |wc -l`
if [[ ${filefound3} > 0 ]]; then
	sed -i 's/pkill -CONT mpg123/pkill -f -CONT BGM.py/g' $RUNONEND
	sed -i 's/#pkill -CONT mpg123/pkill -f -CONT BGM.py/g' $RUNONEND
	sed -i '/#(sleep 2 && \/home\/pi\/BGM_vol_fade.sh.1 -cont) &/d' $RUNONEND
	sed -i '/(sleep 2 && \/home\/pi\/BGM_vol_fade.sh.1 -cont) &/d' $RUNONEND
	sed -i '/(sleep 2 && home\/pi\/BGM_vol_fade.sh.1 -cont) &/d' $RUNONEND
	sed -i '/#(sleep 2 && home\/pi\/BGM_vol_fade.sh.1 -cont) &/d' $RUNONEND
	sed -i '1i #!/bin/sh' $RUNONEND
	sed -i '2i #/etc/init.d/start-sound' $RUNONEND
	sed -i '3i enableexitvideo="true"' $RUNONEND
	sed -i '4i videoexitingscreens="/home/pi/RetroPie/splashscreens"' $RUNONEND
	sed -i '5i if \[\[ $enableexitvideo == "true" \]\]; then' $RUNONEND
	sed -i '6i sudo omxplayer --vol 250 --amp 250 -b $videoexitingscreens/ThanksForPlaying.mp4 > /dev/null 2>&1' $RUNONEND
	sed -i '7i fi' $RUNONEND
	sleep 1
fi

filefound92=`cat /opt/retropie/configs/all/runcommand-onend.sh |grep "pkill -f -CONT BGM.py" |wc -l`
if [[ ${filefound92} > 0 ]]; then echo "$(tput setaf 2)Tamo+ Script Already Found In Runcommand-OnEnd! $(tput sgr0)" > /tmp/exists
else
	if ! grep 'pkill -f -CONT BGM.py' "$RUNONEND" > /dev/null 2>&1; then sed -i -e '$apkill -f -CONT BGM.py' "$RUNONEND" > /dev/null 2>&1; fi
fi

filefound41=`cat /opt/retropie/configs/all/runcommand-onend.sh |grep "/bin/bash" |wc -l`
if [[ ${filefound41} > 0 ]]; then echo "Shebang already in runcommand-onend.sh" > /tmp/exists
else sed -i '1i #!/bin/bash' $RUNONEND; fi

echo -e "$(tput setaf 2)Done! $(tput sgr0)"
sleep 3
clear

cd $HOME
}

install_ending() {
# Explain stuff to the user
ending=""
ending="${ending}TAMO+ and is now installed.\n"
ending="${ending}Run $MENU_DIR/tamoplus.sh or navigate to:\n"
ending="${ending}Retropie > TAMO+, for more options!\n"
ending="${ending}BGM has also been set up to run automatically when the device boots\n"
ending="${ending}to the default (Disabled no music will be playing) folder!\n\n"
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
            03 "Reboot Later and Delete zips" \
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
	exit
}

rebootn() {
	sleep 1
	sudo reboot
}

rebootld() {
	rm -f $INSTALL_DIR/*.zip
	echo -e "$(tput setaf 2)Zip Files Deleted$(tput setaf 0)"
	sleep 1
	exit
}

rebootnd() {
	rm -f $INSTALL_DIR/*.zip
	echo -e "$(tput setaf 2)Zip Files Deleted$(tput setaf 0)"
	sleep 1
	sudo reboot
}

. /home/$currentuser/tamoplus/scripts/tamo-functions

tamo_install_menu
