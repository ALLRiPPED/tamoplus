#!/bin/bash
# TAMO+ Bare Script
# By Chad "thepitster" Ward https://github.com/ALLRiPPED/ 
# & The Supreme Team https://github.com/SupremePi/
ver="v1.20"
SCRIPT_LOC="$HOME/tamoplus/BGM.py"
INSTALL_DIR="$HOME/tamoplus"
MENU_DIR="$HOME/RetroPie/retropiemenu"
STMENU_VIS_DIR="$HOME/RetroPie/retropiemenu/visualtools"
MUSIC_DIR="$HOME/RetroPie/roms/music"
MUSIC_DIR="${MUSIC_DIR/#~/$HOME}"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BACKTITLE="TAMO+ Script $ver"
TITLE="TAMO+ $ver"
AUTOSTART="/opt/retropie/configs/all/autostart.sh"
OLDIFS=$IFS
RUNONSTART="/opt/retropie/configs/all/runcommand-onstart.sh"
VID_LOD_SCR="$HOME/RetroPie/videoloadingscreens"

main_menu() {
stats_check
    local choice
    while true; do
        choice=$(dialog --colors --backtitle "TAMO+ $ver" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose An Option Below" 25 85 20 \
            1 "Theme Settings" \
            2 "Music Settings" \
            3 "Visual Settings" \
            4 "Loading media Settings" \
            5 "Update TAMO+ $ver" \
            6 "View TAMO+ Disclamer" \
            2>&1 > /dev/tty)
        case "$choice" in
            1) themesettings  ;;
            2) musicsettings  ;;
            3) visual_menu  ;;
            4) loading_media  ;;
            5) update_tamo  ;;
            6) disclaim  ;;
            *) break  ;;
        esac
    done
}

visual_menu() {
stats_check
    local choice
    while true; do
        choice=$(dialog --colors --backtitle "Visual Menu - Tamo+ $ver" --title " Visual Menu " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose An Option Below" 25 85 20 \
            1 "Music Overlay Settings" \
            2 "Bezel Project" \
            3 "Full Universal Bezel on/off" \
            4 "Supreme Marquee Tool" \
            5 "Change Resolution" \
            6 "Retroarch Visual Tools" \
            7 "Game Media Removal Utility" \
            8 "RetroPie splashscreen Utility" \
            9 "Skyscraper Utility" \
           10 "Simple Genesis & MegaDrive Swap" \
           11 "Overscan On/Off Switch" \
           2>&1 > /dev/tty)
        case "$choice" in
            1) overlay_menu ;;
            2) bezel_project ;;
            3) universal_bezel ;;
            4) supreme_marquee_tool ;;
            5) resolution_tool ;;
            6) retroarch_tool ;;
            7) remove_media ;;
            8) retropie_splashscreen ;;
            9) skyscraper_utility ;;
           10) sega_swap ;;
           11) overscan_switch ;;
            *) break ;;
        esac
    done
}

bezel_project() {
if [ -f "$INSTALL_DIR/scripts/bezelproject.sh" ]; then 

#Adds Updated Version to tampo Folder
if [ -f "$MENU_DIR/bezelproject.sh" ]; then sudo mv -f $MENU_DIR/bezelproject.sh $INSTALL_DIR/scripts/; fi
if [ -f "$STMENU_VIS_DIR/bezelproject.sh" ]; then sudo mv -f $STMENU_VIS_DIR/bezelproject.sh $INSTALL_DIR/scripts/; fi

chmod +x $INSTALL_DIR/scripts/bezelproject.sh
$INSTALL_DIR/scripts/bezelproject.sh

else

if [ -f "$MENU_DIR/bezelproject.sh" ]; then sudo rm -f -r $MENU_DIR/bezelproject.sh; fi
if [ -f "$STMENU_VIS_DIR/bezelproject.sh" ]; then sudo rm -f -r $STMENU_VIS_DIR/bezelproject.sh; fi

cd "$INSTALL_DIR/scripts/"
wget "https://raw.githubusercontent.com/thebezelproject/BezelProject/master/bezelproject.sh"
chmod +x "bezelproject.sh"

if [ ! -d "$INSTALL_DIR/scripts" ]; then mkdir $INSTALL_DIR/scripts; fi

mv -f $MENU_DIR/bezelproject.sh $INSTALL_DIR/scripts/bezelproject.sh
$INSTALL_DIR/scripts/bezelproject.sh

fi
}

universal_bezel() {
chmod 755 $INSTALL_DIR/scripts/bezels.sh
$INSTALL_DIR/scripts/bezels.sh
}

supreme_marquee_tool() {
#Added step because marquee script reboots on clean install - Checks if the marquee script has been installed.
if [ -f "/home/pi/PieMarquee2/scripts/supreme-marquee-tool.sh" ]; then sudo mv -f /home/pi/PieMarquee2/scripts/supreme-marquee-tool.sh $INSTALL_DIR/scripts/; fi
if [ -f "/home/pi/PieMarquee3/scripts/supreme-marquee-tool.sh" ]; then sudo mv -f /home/pi/PieMarquee2/scripts/supreme-marquee-tool.sh $INSTALL_DIR/scripts/; fi

if [ -f "$INSTALL_DIR/scripts/supreme-marquee-tool.sh" ]; then 

#Adds Updated Version to tampo Folder
if [ -f "$MENU_DIR/supreme-marquee-tool.sh" ]; then sudo mv -f $MENU_DIR/supreme-marquee-tool.sh $INSTALL_DIR/scripts/; fi
if [ -f "$STMENU_VIS_DIR/supreme-marquee-tool.sh" ]; then sudo mv -f $STMENU_VIS_DIR/supreme-marquee-tool.sh $INSTALL_DIR/scripts/; fi

chmod +x $INSTALL_DIR/scripts/supreme-marquee-tool.sh
$INSTALL_DIR/scripts/supreme-marquee-tool.sh

else

if [ -f "$MENU_DIR/supreme-marquee-tool.sh" ]; then sudo rm -f -r $MENU_DIR/supreme-marquee-tool.sh; fi
if [ -f "$STMENU_VIS_DIR/supreme-marquee-tool.sh" ]; then sudo rm -f -r $STMENU_VIS_DIR/supreme-marquee-tool.sh; fi

cd /home/pi
git clone https://github.com/SupremePi/PieMarquee2.git
cd PieMarquee2
chmod 755 ./install.sh
./install.sh

if [ ! -d "$INSTALL_DIR/scripts" ]; then mkdir $INSTALL_DIR/scripts; fi

mv -f $MENU_DIR/supreme-marquee-toolsh $INSTALL_DIR/scripts/supreme-marquee-tool.sh
$INSTALL_DIR/scripts/supreme-marquee-tool.sh

fi
}

resolution_tool() {
chmod 755 $INSTALL_DIR/scripts/resolution-tool.sh
$INSTALL_DIR/scripts/resolution-tool.sh
}

retroarch_tool() {
chmod 755 $INSTALL_DIR/scripts/retroarch-tool.sh
$INSTALL_DIR/scripts/retroarch-tool.sh
}

remove_media() {
chmod 755 $INSTALL_DIR/scripts/remove-media.sh
$INSTALL_DIR/scripts/remove-media.sh
}

retropie_splashscreen() {
if [ -f "$MENU_DIR/splashscreen.rp" ]; then sudo rm -f -r $MENU_DIR/splashscreen.rp; fi
sudo ~/RetroPie-Setup/retropie_packages.sh esthemes gui
}

skyscraper_utility() {
chmod 755 $INSTALL_DIR/scripts/skyscraper.sh
$INSTALL_DIR/scripts/skyscraper.sh
}

sega_swap() {
chmod 755 $INSTALL_DIR/scripts/genesis.sh
$INSTALL_DIR/scripts/genesis.sh
}

overscan_switch() {
chmod 755 $INSTALL_DIR/scripts/overscanswitch.sh
$INSTALL_DIR/scripts/overscanswitch.sh
}
loading_media() {
stats_check
    local choice
    while true; do
        choice=$(dialog --colors --backtitle "Loading Media Menu - Tamo+ $ver" --title " Loading Media Menu " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose An Option Below" 25 85 20 \
            1 "Loading Videos Menu" \
            2 "Loading Screens Menu" \
           2>&1 > /dev/tty)
        case "$choice" in
            1) loading_video ;;
            2) loading_screens ;;
            *) break ;;
        esac
    done
}

loading_video() {
stats_check
    local choice
    while true; do
        choice=$(dialog --colors --backtitle "Loading Video Menu - Tamo+ $ver" --title " Loading video Menu " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose An Option Below" 25 85 20 \
            1 "Enable/Disable Videoloadingscreens $vls" \
            2 "Set Videoloadingscreens Folder" \
           2>&1 > /dev/tty)
        case "$choice" in
            1) video_screens  ;;
            2) set_video_screens  ;;
            *) break ;;
        esac
    done
}

loading_screens() {
stats_check
    local choice
    while true; do
        choice=$(dialog --colors --backtitle "Loading Video Menu - Tamo+ $ver" --title " Loading video Menu " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose An Option Below" 25 85 20 \
            1 "Pick Installed launching screens" \
            2 "Remove Launching Screens" \
            3 "Download Launching Screens" \
           2>&1 > /dev/tty)
        case "$choice" in
            1) install_screens  ;;
            2) remove_screens  ;;
            3) download_screens  ;;
            *) break ;;
        esac
    done
}

function install_screens() {

FILE=""
DIR="$HOME/RetroPie/LaunchingScreens"
	if [ "$(ls -A $DIR)" ]; then

ls $HOME/RetroPie/LaunchingScreens |grep -v README > /tmp/displays

let i=0 # define counting variable
W=() # define working array
while read -r line; do # process file by file
    let i=$i+1
    W+=($i "$line")
done < <(cat /tmp/displays)

CONFDISP=$(dialog --title "RetroPie Launching Screens Utility" --menu "Current available launching screenset.  Chose one to install." 24 80 17 "${W[@]}" 3>&2 2>&1 1>&3)

clear

if [ -z $CONFDISP ]; then
   return

else

if [[ ! -d "$HOME/RetroPie/LaunchingScreens" ]]; then
mkdir -p "$HOME/RetroPie/LaunchingScreens"
fi

if [[ -f "/opt/retropie/configs/*/launching.png" ]]; then
rm /opt/retropie/configs/*/launching.png
fi
 
if [[ -f "/opt/retropie/configs/*/launching.jpg" ]]; then
rm /opt/retropie/configs/*/launching.jpg
fi

if [[ -f "/tmp/displays" ]]; then
currentdisplay=`sed -n ${CONFDISP}p /tmp/displays`
cp -r $HOME/RetroPie/LaunchingScreens/${currentdisplay}/* /opt/retropie/configs
else
echo -e "$(tput setaf 2)No Themes Installed?. $(tput sgr0)"
sleep 5
fi
fi

echo -e "$(tput setaf 2)Done. $(tput sgr0)"
sleep 3

else

if (dialog --title "NO THEMES INSTALLED!" --yesno "Would You Like To Install One?" 0 0 )
then
        download_screens
	else
        echo -e "$(tput setaf 2)Skipping. $(tput sgr0)"
        sleep 3
  	fi

fi
}

function remove_screens() {
echo -e "$(tput setaf 2)Removing LaunchingScreens Please Wait. $(tput sgr0)"
sleep 3

if [[ ! -d "$HOME/RetroPie/LaunchingScreens" ]]; then
mkdir -p "$HOME/RetroPie/LaunchingScreens"
fi

if [[ -f "/opt/retropie/configs/*/launching.png" ]]; then
rm /opt/retropie/configs/*/launching.png
fi

echo -e "$(tput setaf 2)Done. $(tput sgr0)"
sleep 3
}

###
# New section for downloading new launching screens from Github
###

function install_launching_screens() {
    local theme="$1"
    local repo="$2"
    if [[ -z "$repo" ]]; then
        repo="default"
    fi
    if [[ -z "$theme" ]]; then
        theme="default"
        repo="default"
    fi
    rm -rf "$HOME/RetroPie/LaunchingScreens/$theme"
    mkdir -p "$HOME/RetroPie/LaunchingScreens"
    git clone "https://github.com/$repo/launchingscreens-$theme.git" "$HOME/RetroPie/LaunchingScreens/$theme"
    echo -e "$(tput setaf 2)Done. $(tput sgr0)"
    sleep 3
}

function uninstall_launching_screens() {
    local theme="$1"
    if [[ -d "$HOME/RetroPie/LaunchingScreens/$theme" ]]; then
        rm -rf "$HOME/RetroPie/LaunchingScreens/$theme"
    fi
}

function download_screens() {
    local themes=(
        'dmmarti hurstyblue'
        'dmmarti motionblue'
        'dmmarti gridblue'
        'dmmarti simple_gray'
        'jtgoshaff 16x9comicbasic'
        'jtgoshaff 16x9ComicRip'
        'jtgoshaff 16x9NESMini'
        'jtgoshaff 4x3ComicRip'
        'jtgoshaff 4x3NESMini'
        'jtgoshaff Carbon'
        'jtgoshaff CleanLook'
        'jtgoshaff Luminous'
        'jtgoshaff Material'
        'jtgoshaff Metapixel'
        'jtgoshaff NBBA'
        'jtgoshaff Pixel'
        'jtgoshaff Simple'
        'jtgoshaff ntscNESmini'
        'jtgoshaff SwitchStyle'
        'jtgoshaff Tronkyfran'
        'jtgoshaff 4x3comicbasic'
        'jtgoshaff Comicbook'
    )
    while true; do
        local theme
        local installed_themes=()
        local repo
        local options=()
        local status=()
        local default

        options+=(U "Update install script - script will exit when updated")

        local i=1
        for theme in "${themes[@]}"; do
            theme=($theme)
            repo="${theme[0]}"
            theme="${theme[1]}"
            if [[ -d "$HOME/RetroPie/LaunchingScreens/$theme" ]]; then
                status+=("i")
                options+=("$i" "Update or Uninstall $theme (installed)")
                installed_themes+=("$theme $repo")
            else
                status+=("n")
                options+=("$i" "Install $theme (not installed)")
            fi
            ((i++))
        done
        local cmd=(dialog --default-item "$default" --backtitle "$__backtitle" --menu "RetroPie Launching Screens Downloader - Choose an option" 22 76 16)
        local choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        default="$choice"
        [[ -z "$choice" ]] && break
        case "$choice" in
            U)  #update install script to get new theme listings
                git clone --depth=1 https://github.com/ALLRiPPED/tamoplus.git
                cd tamoplus
                sudo chmod +x local_installer.sh
                ./local_installer.sh
                exit
                ;;
            *)  #install or update themes
                theme=(${themes[choice-1]})
                repo="${theme[0]}"
                theme="${theme[1]}"
#                if [[ "${status[choice]}" == "i" ]]; then
                if [[ -d "$HOME/RetroPie/LaunchingScreens/$theme" ]]; then
                    options=(1 "Update $theme" 2 "Uninstall $theme")
                    cmd=(dialog --backtitle "$__backtitle" --menu "Choose an option for the launching screens pack" 12 40 06)
                    local choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                    case "$choice" in
                        1)
                            install_launching_screens "$theme" "$repo"
                            ;;
                        2)
                            uninstall_launching_screens "$theme"
                            ;;
                    esac
                else
                    install_launching_screens "$theme" "$repo"
                fi
                ;;
        esac
    done
}

themesettings() {
stats_check
    local choice
    while true; do
        choice=$(dialog --colors --backtitle "Theme Settings - TAMO+ $ver" --title " Theme Settings " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose An Option Below" 25 85 20 \
            1 "Hursty Themes" \
            2 "RetroPie Themes" \
           2>&1 > /dev/tty)
        case "$choice" in
            1) hursty_themes ;;
            2) retropie_themes ;;
            *) break ;;
        esac
    done
}

hursty_themes() {
if [ -f "$INSTALL_DIR/scripts/hurstythemes.sh" ]; then 

#Adds Updated Version to tamoplus Folder
if [ -f "$MENU_DIR/hurstythemes" ]; then sudo mv -f $MENU_DIR/hurstythemes $INSTALL_DIR/scripts/; fi
if [ -f "$STMENU_VIS_DIR/hurstythemes" ]; then sudo mv -f $STMENU_VIS_DIR/hurstythemes $INSTALL_DIR/scripts/; fi

chmod +x $INSTALL_DIR/scripts/hurstythemes.sh
$INSTALL_DIR/scripts/hurstythemes.sh

else

if [ -f "$MENU_DIR/hurstythemes" ]; then sudo rm -f -r $MENU_DIR/hurstythemes; fi
if [ -f "$STMENU_VIS_DIR/hurstythemes" ]; then sudo rm -f -r $STMENU_VIS_DIR/hurstythemes; fi

wget https://raw.githubusercontent.com/RetroHursty69/HurstyThemes/master/install.sh "$INSTALL_DIR/tmp/install.sh"
chmod +x "$INSTALL_DIR/tmp/install.sh"
./$INSTALL_DIR/tmp/install.sh

if [ ! -d "$INSTALL_DIR/scripts" ]; then mkdir $INSTALL_DIR/scripts; fi

mv -f $MENU_DIR/hurstythemes.sh $INSTALL_DIR/scripts/hurstythemes.sh
$INSTALL_DIR/scripts/hurstythemes.sh

rm -fr "$INSTALL_DIR/tmp"
fi
}

retropie_themes() {
if [ -f "$MENU_DIR/esthemes.rp" ]; then sudo rm -f -r $MENU_DIR/esthemes.rp; fi
sudo ~/RetroPie-Setup/retropie_packages.sh esthemes gui
}

musicsettings() {
stats_check
    local choice
    while true; do
        choice=$(dialog --colors --backtitle "Music Settings - TAMO+ $ver" --title " Music Settings " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose An Option Below" 25 85 20 \
            1 "Enable/Disable Background Music $bgms" \
            2 "Enable/Disable BGM On-Boot $bgmos" \
            3 "Music Selection $ms" \
            4 "Volume Control $vol" \
            5 "Music Start Delay In Seconds $msd" \
            6 "Retropie Audio Settings" \
            7 "Quick No Audio Fixs" \
           2>&1 > /dev/tty)
        case "$choice" in
            1) enable_music ;;
            2) enable_musicos ;;
            3) music_select ;;
            4) set_bgm_volume ;;
            5) music_startdelay ;;
            6) retropie_audio_settings ;;
            7) quick_audio_fixes ;;
            *) break ;;
        esac
    done
}

retropie_audio_settings() {
if [ -f "$MENU_DIR/audiosettings.rp" ]; then sudo rm -f -r $MENU_DIR/audiosettings.rp; fi
sudo ~/RetroPie-Setup/retropie_packages.sh audiosettings gui
}

quick_audio_fixes() {
stats_check
    local choice
    while true; do
        choice=$(dialog --colors --backtitle "Quick Audio Fixes - TAMO+ $ver" --title " Music Settings " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose An Option Below" 25 85 20 \
            1 "No Audio Fix  (Try this First)" \
            2 "No Audio Force 720p" \
            3 "No Audio Force 1080p" \
           2>&1 > /dev/tty)
        case "$choice" in
            1) no_audio_fix  ;;
            2) no_audio_force_720p  ;;
            3) no_audio_force_1080p  ;;
            *) break  ;;
        esac
    done
}

no_audio_fix() {
sudo grep hdmi_force_edid_audio /boot/config.txt > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "The Audio changes have already been made. If you are still not getting audio then there must be another issue."
sleep 4
echo "For now I will reverse the changes since they did not help you."
sleep 5
sudo perl -p -i -e 's/hdmi_force_edid_audio=1/#dtoverlay=lirc-rpi/g' /boot/config.txt
sudo perl -p -i -e 's/hdmi_force_hotplug=1/#hdmi_force_hotplug=1/g' /boot/config.txt
sudo perl -p -i -e 's/hdmi_drive=2/#hdmi_drive=2/g' /boot/config.txt
else
echo "I have scanned the config file and see that the audio fix is NOT in place."
sleep 4
echo "If this fix does not work please run the script again to roll the changes back."
sleep 10
echo "I will make the necessary config changes and reboot your Pi"
sleep 5
sudo perl -p -i -e 's/#dtoverlay=lirc-rpi/hdmi_force_edid_audio=1/g' /boot/config.txt
sudo perl -p -i -e 's/#hdmi_force_hotplug=1/hdmi_force_hotplug=1/g' /boot/config.txt
sudo perl -p -i -e 's/#hdmi_drive=2/hdmi_drive=2/g' /boot/config.txt
sudo reboot
fi
}

no_audio_force_720p() {
sudo grep hdmi_mode=16 /boot/config.txt > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "It looks like you have tried the Force 1080p script. Please run it again to roll the changes back before running this script."
sleep 10
exit
fi
sudo grep hdmi_mode=4 /boot/config.txt > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "The Audio changes have already been made. If you are still not getting audio then there must be another issue."
sleep 4
echo "For now I will reverse the changes since they did not help you."
sleep 5
sudo perl -p -i -e 's/hdmi_group=1/#hdmi_group=1/g' /boot/config.txt
sudo perl -p -i -e 's/hdmi_mode=4/#hdmi_mode=1/g' /boot/config.txt
else
echo "I have scanned the config file and see that Force 720p is not cofigured."
sleep 4
echo "I will make the necessary config changes and reboot your Pi. If this does not fix your issue please run this script again to reverse the changes."
sleep 5
sudo perl -p -i -e 's/#hdmi_group=1/hdmi_group=1/g' /boot/config.txt
sudo perl -p -i -e 's/#hdmi_mode=1/hdmi_mode=4/g' /boot/config.txt
sudo reboot
fi
}

no_audio_force_1080p() {
sudo grep hdmi_mode=4 /boot/config.txt > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "It looks like you have tried the Force 720p script. Please run it again to roll the changes back before running this script."
sleep 10
exit
fi
sudo grep hdmi_mode=16 /boot/config.txt > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "Looks like we have already tried to force 1080p output. If you are still not getting audio then there must be another issue."
sleep 4
echo "For now I will reverse the changes since they did not help you. They will take effect after the next reboot"
sleep 5
sudo perl -p -i -e 's/hdmi_group=1/#hdmi_group=1/g' /boot/config.txt
sudo perl -p -i -e 's/hdmi_mode=16/#hdmi_mode=1/g' /boot/config.txt
else
echo "I have scanned the config file and see that 1080p is not being forced."
sleep 4
echo "I will make the necessary config changes and reboot your Pi"
sleep 5
sudo perl -p -i -e 's/#hdmi_group=1/hdmi_group=1/g' /boot/config.txt
sudo perl -p -i -e 's/#hdmi_mode=1/hdmi_mode=16/g' /boot/config.txt
sudo reboot
fi
}

overlay_menu() {
stats_check
local choice
    while true; do
        choice=$(dialog --colors --backtitle "Choose OverLay Settings" --title " Overlay Menu " \
            --ok-label OK --cancel-label Back \
            --menu "What action would you like to perform?" 25 85 20 \
            1 "Enable/Disable Overlay $ovs" \
            2 "Enable/Disable Overlay Fadeout $ovf" \
            3 "Adjust Overlay Fadeout In Seconds $oft" \
            4 "Enable/Disable Overlay Rounded Corners $ocr" \
            5 "Enable/Disable Overlay Line Separator $ons" \
            6 "Vertical Position: $vpos" \
            7 "Horizontal Position: $hpos" \
            2>&1 > /dev/tty)
        case "$choice" in
            1) overlay_enable ;;
            2) overlay_fade_out ;;
            3) overlay_fade_out_time ;;
            4) overlay_rounded_corners ;;
            5) overlay_replace_newline ;;
            6) overlay_v_pos ;;
            7) overlay_h_pos ;;
            *) break ;;
        esac
    done
}

set_bgm_volume() {
  local CUR_VOL
  CUR_VOL=$(grep "maxvolume =" "$SCRIPT_LOC"|awk '{print $3}' | awk '{print $1 * 100}')
  export CUR_VOL
  local NEW_VOL
  NEW_VOL=$(dialog \
	--backtitle "$BACKTITLE" \
	--title "$TITLE" \
	--rangebox "Set volume level (D+/U-): " 0 50 0 100 "$CUR_VOL" \
	2>&1 >/dev/tty)
if [ -z "$NEW_VOL" ] || [ "$NEW_VOL" == "$CUR_VOL" ]; then return; fi;
  echo "BGM volume set to $NEW_VOL%"
  NEW_VOL=$(echo  "$NEW_VOL" | awk '{print $1 / 100}')
  export NEW_VOL
  CUR_VOL=$(echo  "$CUR_VOL" | awk '{print $1 / 100}')
  export CUR_VOL
perl -p -i -e 's/maxvolume = $ENV{CUR_VOL}/maxvolume = $ENV{NEW_VOL}/g' $SCRIPT_LOC
bgm_check
stats_check
}

music_select() {
stats_check
local choice
    while true; do
        choice=$(dialog --colors --backtitle "Select Your Music Choice" --title " Music Selection " \
            --ok-label OK --cancel-label Back \
            --menu "What action would you like to perform?" 25 85 20 \
            1 "Change Music Folder" \
            2 "Disable Music Folder" \
            2>&1 > /dev/tty)
        case "$choice" in
            1) set_music_dir ;;
            2) disable_music_dir ;;
            *) break ;;
        esac
    done
}

set_music_dir() {
stats_check
  CUR_DIR=""
  CUR_PLY=""
  SELECTION=""
  SELECT=""
  IFS=$'\n'
  local SELECTION
  CUR_DIR=$(grep "musicdir =" "$SCRIPT_LOC" |(awk '{print $3}') | tr -d '"')/
  export CUR_DIR
  while [ -z $SELECTION ]; do
    [[ "${CUR_DIR}" ]] && CUR_DIR="${CUR_DIR}"/
    local cmd=(dialog --colors \
      --backtitle "$BACKTITLE | Current Folder: $CUR_DIR" \
      --title "$TITLE" \
      --menu "Choose a music directory" 20 70 20 )
    local iterator=1
    local offset=-1
    local options=()
    if [ "$(dirname $CUR_DIR)" != "$CUR_DIR" ]; then
      options+=(0)
      options+=("Parent Directory")
      offset=$(($offset+2))
    fi
    options+=($iterator)
    options+=("<Use This Directory>")
    iterator=$(($iterator+1))
    for DIR in $(find "$CUR_DIR" -maxdepth 1 -mindepth 1 -type d | sort); do
      options+=($iterator)
      options+=("$(basename $DIR)")
      iterator=$(($iterator+1))
    done
    choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    case $choice in
      0) CUR_DIR="$(dirname $CUR_DIR)" ;;
      1) SELECTION="$CUR_DIR" ;;
      '') return ;;
      *) CUR_DIR="$CUR_DIR${options[ $((2*choice + $offset )) ]}" ;;
    esac
  done
  [[ "${MUSIC_DIR}" ]] && MUSIC_DIR="${MUSIC_DIR}"
  if [ "$SELECTION" != "$MUSIC_DIR" ]; then
    echo "Music directory changed to '$SELECTION'"
    CUR_PLY=$(grep "musicdir =" "$SCRIPT_LOC"|awk '{print $3}')
    export CUR_PLY
    SELECT=$(echo $SELECTION | sed 's:/*$::')
    sed -i -E "s|musicdir = ${CUR_PLY}|musicdir = \"${SELECT}\"|g" $SCRIPT_LOC
    bgm_check
  elif [ "$SELECTION" == "$MUSIC_DIR" ]; then
    echo "Music directory is already '$SELECTION'"
  else
    return
  fi
  IFS=$OLDIFS
bgm_check
stats_check
}

music_startdelay() {
oldstartdelaytime=$(grep "startdelay = " "$SCRIPT_LOC"|awk '{print $3}')
export oldstartdelaytime
startdelaytime=$(dialog --colors --title "Adjust the Music Start Delay" \
	--inputbox "Input the Start Delay Time:" 8 40 "$oldstartdelaytime" 3>&1 1>&2 2>&3 3>&-)
export startdelaytime
if [ $startdelaytime ]; then
perl -p -i -e 's/startdelay = $ENV{oldstartdelaytime}/startdelay = $ENV{startdelaytime}/g' $SCRIPT_LOC
else
	return
fi
bgm_check
stats_check
}

enable_music() {
if [ -f "$INSTALL_DIR"/DisableMusic ]; then
	sudo rm -f "$INSTALL_DIR"/DisableMusic
	(nohup python $SCRIPT_LOC > /dev/null 2>&1) &
else
	touch "$INSTALL_DIR"/DisableMusic
	pgrep -f "BGM.py" |xargs sudo kill -9 > /dev/null 2>&1 &
	pgrep -f pngview|xargs sudo kill -9 > /dev/null 2>&1 &
fi
sleep 1
stats_check
}

enable_musicos() {
if grep -q "#(nohup python $SCRIPT_LOC > /dev/null 2>&1) &" "$AUTOSTART"; then
	sudo sed -i 's/\#(nohup python/(nohup python/g' $AUTOSTART
elif grep -q "(nohup python $SCRIPT_LOC > /dev/null 2>&1) &" "$AUTOSTART"; then
	sudo sed -i 's/(nohup python/\#(nohup python/g' $AUTOSTART
fi
stats_check
}

disable_music_dir() {
CUR_PLY=$(grep "musicdir =" "$SCRIPT_LOC"|awk '{print $3}')
export CUR_PLY
DEF_DIR='"/home/pi/tamoplus"'
export DEF_DIR
sed -i -E "s|musicdir = ${CUR_PLY}|musicdir = ${DEF_DIR}|g" $SCRIPT_LOC
bgm_check
stats_check
}

video_screens() {
if grep -q 'enablevideolaunch="true"' "$RUNONSTART"; then sed -i -E 's|enablevideolaunch="true"|enablevideolaunch="false"|g' $RUNONSTART
else sed -i -E 's|enablevideolaunch="false"|enablevideolaunch="true"|g' $RUNONSTART; fi
stats_check
}

set_video_screens() {
stats_check
  CUR_LOD=""
  NEW_LOD=""
  SELECTION=""
  SELECT=""
  IFS=$'\n'
  local SELECTION
  CUR_LOD=$(grep "videoloadingscreens=" "$RUNONSTART"|grep -o '".*"' | tr -d '"')
  export CUR_LOD
  while [ -z $SELECTION ]; do
    [[ "${CUR_LOD}" ]] && CUR_LOD="${CUR_LOD}"/
    local cmd=(dialog --colors \
      --backtitle "$BACKTITLE | Current Folder: $CUR_LOD" \
      --title "$TITLE" \
      --menu "Choose a Videoloadingscreens directory" 20 70 20 )
    local iterator=1
    local offset=-1
    local options=()
    if [ "$(dirname $CUR_LOD)" != "$CUR_LOD" ]; then
      options+=(0)
      options+=("Parent Directory")
      offset=$(($offset+2))
    fi
    options+=($iterator)
    options+=("<Use This Directory>")
    iterator=$(($iterator+1))
    for DIR in $(find "$CUR_LOD" -maxdepth 1 -mindepth 1 -type d | sort); do
      options+=($iterator)
      options+=("$(basename $DIR)")
      iterator=$(($iterator+1))
    done
    choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    case $choice in
      0) CUR_LOD="$(dirname $CUR_LOD)" ;;
      1) SELECTION="$CUR_LOD" ;;
      '') return ;;
      *) CUR_LOD="$CUR_LOD${options[ $((2*choice + $offset )) ]}" ;;
    esac
  done
  [[ "${VID_LOD_SCR}" ]] && VID_LOD_SCR="${VID_LOD_SCR}"
  if [ "$SELECTION" != "$VID_LOD_SCR" ]; then
    echo "Videoloadingscreens directory changed to '$SELECTION'"
    NEW_LOD=$(grep "videoloadingscreens=" "$RUNONSTART"|grep -o '".*"')
    export NEW_LOD
    SELECT=$(echo $SELECTION | sed 's:/*$::')
	sed -i -E "s|videoloadingscreens=${NEW_LOD}|videoloadingscreens=\"${SELECT}\"|g" $RUNONSTART
    bgm_check
  elif [ "$SELECTION" == "$VID_LOD_SCR" ]; then
    echo "Videoloadingscreens directory is already '$SELECTION'"
  else
    return
  fi
  IFS=$OLDIFS
bgm_check
stats_check
}

overlay_enable() {
if grep -q 'overlay_enable = True' "$SCRIPT_LOC"; then
	sed -i -E 's/overlay_enable = True/overlay_enable = False/g' $SCRIPT_LOC
elif grep -q 'overlay_enable = False' "$SCRIPT_LOC"; then
	sed -i -E 's/overlay_enable = False/overlay_enable = True/g' $SCRIPT_LOC
fi
bgm_check
stats_check
}

overlay_fade_out() {
if grep -q 'overlay_fade_out = True' "$SCRIPT_LOC"; then
	sed -i -E 's/overlay_fade_out = True/overlay_fade_out = False/g' $SCRIPT_LOC
elif grep -q 'overlay_fade_out = False' "$SCRIPT_LOC"; then
	sed -i -E 's/overlay_fade_out = False/overlay_fade_out = True/g' $SCRIPT_LOC
fi
bgm_check
stats_check
}

overlay_fade_out_time() {
oldfadeouttime=$(grep "overlay_fade_out_time = " "$SCRIPT_LOC"|awk '{print $3}')
export oldfadeouttime
fadeouttime=$(dialog \
	--colors \
	--title "Adjust the Fadeout time of the Relay" \
	--inputbox "Input the Relay Fadeout Time:" 8 40 "$oldfadeouttime" 3>&1 1>&2 2>&3 3>&-)
export fadeouttime
if [ $fadeouttime ]; then
perl -p -i -e 's/overlay_fade_out_time = $ENV{oldfadeouttime}/overlay_fade_out_time = $ENV{fadeouttime}/g' $SCRIPT_LOC
else
	return
fi
bgm_check
stats_check
}

overlay_rounded_corners() {
if grep -q 'overlay_rounded_corners = True' "$SCRIPT_LOC"; then
	sed -i -E 's/overlay_rounded_corners = True/overlay_rounded_corners = False/g' $SCRIPT_LOC
elif grep -q 'overlay_rounded_corners = False' "$SCRIPT_LOC"; then
	sed -i -E 's/overlay_rounded_corners = False/overlay_rounded_corners = True/g' $SCRIPT_LOC
fi
bgm_check
stats_check
}

overlay_replace_newline() {
if grep -q 'overlay_replace_newline = True' "$SCRIPT_LOC"; then
	sed -i -E 's/overlay_replace_newline = True/overlay_replace_newline = False/g' $SCRIPT_LOC
elif grep -q 'overlay_replace_newline = False' "$SCRIPT_LOC"; then
	sed -i -E 's/overlay_replace_newline = False/overlay_replace_newline = True/g' $SCRIPT_LOC
fi
bgm_check
stats_check
}

overlay_v_pos() {
CUR_VPOS=$(grep "overlay_y_offset =" "$SCRIPT_LOC"|awk '{print $3}')
export CUR_VPOS
NEW_VPOST='"0"'
export NEW_VPOST
NEW_VPOSB=\"$((height-overlay_h_size))\"
export NEW_VPOSB
if [ $CUR_VPOS = \"0\" ]; then
	sed -i -E "s/overlay_y_offset = ${CUR_VPOS}/overlay_y_offset = ${NEW_VPOSB}/g" $SCRIPT_LOC
else
	sed -i -E "s/overlay_y_offset = ${CUR_VPOS}/overlay_y_offset = ${NEW_VPOST}/g" $SCRIPT_LOC
fi
bgm_check
stats_check
}

overlay_h_pos() {
CUR_HPOS=$(grep "overlay_x_offset =" "${SCRIPT_LOC}"|awk '{print $3}')
export CUR_HPOS
NEW_HPOSL='"0"'
export NEW_HPOSL
NEW_HPOSR=\"$((width-overlay_w_size))\"
export NEW_HPOSR
if [ $CUR_HPOS = \"0\" ]; then
	sed -i -E "s/overlay_x_offset = ${CUR_HPOS}/overlay_x_offset = ${NEW_HPOSR}/g" $SCRIPT_LOC
else
	sed -i -E "s/overlay_x_offset = ${CUR_HPOS}/overlay_x_offset = ${NEW_HPOSL}/g" $SCRIPT_LOC
fi
bgm_check
stats_check
}

stats_check() {
enable="\Z2Enabled\Zn"
disable="\Z1Disabled\Zn"
if [ -f $HOME/tamoplus/DisableMusic ]; then
	bgms=$disable
else
	bgms=$enable
fi
if grep -q "#(nohup python $SCRIPT_LOC > /dev/null 2>&1) &" "$AUTOSTART"; then
	bgmos=$disable
elif grep -q "(nohup python $SCRIPT_LOC > /dev/null 2>&1) &" "$AUTOSTART"; then
	bgmos=$enable
fi
if grep -q "overlay_enable = True" "$SCRIPT_LOC"; then
	ovs=$enable
else
	ovs=$disable
fi
if grep -q "overlay_fade_out = True" "$SCRIPT_LOC"; then
	ovf=$enable
else
	ovf=$disable
fi
overlay_fadeout_time=$(grep "overlay_fade_out_time = " "$SCRIPT_LOC"|awk '{print $3}')
oft="\Z3$overlay_fadeout_time\Zn"
msd=$(grep "startdelay = " "$SCRIPT_LOC"|awk '{print $3}')
msd="\Z3$msd\Zn"
if grep -q "overlay_rounded_corners = True" "$SCRIPT_LOC"; then
	ocr=$enable
else
	ocr=$disable
fi
if grep -q "overlay_replace_newline = True" "$SCRIPT_LOC"; then
	ons=$enable
else
	ons=$disable
fi
CUR_HPOS=$(grep "overlay_x_offset =" "$SCRIPT_LOC"|awk '{print $3}' | tr -d '"')
if [ $CUR_HPOS = "0" ]; then
	hpos="\Z3Left\Zn"
else
	hpos="\Z3Right\Zn"
fi
CUR_VPOS=$(grep "overlay_y_offset =" "$SCRIPT_LOC"|awk '{print $3}' | tr -d '"')
export CUR_VPOS
if [ $CUR_VPOS = "0" ]; then
	vpos="\Z3Top\Zn"
else
	vpos="\Z3Bottom\Zn"
fi
if grep -q 'musicdir = "/home/pi/tamoplus"' "$SCRIPT_LOC"; then
	ms=$disable
else
	CUR_PLY=$(grep "musicdir =" "$SCRIPT_LOC"|awk '{print $3}')
	export CUR_PLY
	ms="\Z3$(basename $CUR_PLY | tr -d '"')\Zn"
fi
vol=$(grep "maxvolume =" "$SCRIPT_LOC"|awk '{print $3}' | awk '{print $1 * 100}')
vol="\Z3$vol%\Zn"
if grep -q 'enablevideolaunch="true"' "$RUNONSTART"; then vls=$enable; else vls=$disable; fi
width=$(fbset -fb /dev/fb0 | grep '\".*\"' | grep -m 1 -o '[0-9][0-9][0-9]\+x' | tr -d 'x')
height=$(fbset -fb /dev/fb0 | grep '\".*\"' | grep -m 1 -o 'x[0-9][0-9][0-9]\+' | tr -d 'x')
if [ "${width}" -ge 3800 ] && [ "${height}" -ge 2100 ]; then
	res="2160p"
elif [ "${width}" -ge 1900 ] && [ "${height}" -ge 1000 ] && [ "${width}" -le 2100 ] && [ "${height}" -le 3800 ]; then
	res="1080p"
elif [ "${width}" -ge 1000 ] && [ "${height}" -ge 600 ] && [ "${width}" -le 1900 ] && [ "${height}" -le 1000 ]; then
	res="720p"
elif [ "${height}" -le 599 ]; then
	res="SD"
fi
resolution="\Z3$res\Zn"
if [ "${width}" -ge 1900 ] && [ "${height}" -ge 1000 ]; then
	overlay_w_size=600
	overlay_h_size=32
elif [ "${width}" -ge 1000 ] && [ "${height}" -ge 600 ] && [ "${width}" -le 1900 ] && [ "${height}" -le 1000 ]; then
	overlay_w_size=300
	overlay_h_size=21
elif [ "${height}" -le 599 ]; then
	overlay_w_size=150
	overlay_h_size=15
fi
}

bgm_check() {
if [ -f "$INSTALL_DIR"/DisableMusic ]; then
	echo "Background Music Disabled!"
else
	pgrep -f "BGM.py" |xargs sudo kill -9 > /dev/null 2>&1 &
	pgrep -f pngview|xargs sudo kill -9 > /dev/null 2>&1 &
	sleep 1
	(nohup python $SCRIPT_LOC > /dev/null 2>&1) &
fi
sleep 1
}

update_tamo() {
if [ -d "$INSTALL_DIR" ]; then sudo rm -f -r $INSTALL_DIR; fi
git clone --depth=1 https://github.com/ALLRiPPED/tamoplus.git
cd tamoplus
sudo chmod +x local_installer.sh
./local_installer.sh
}

disclaim() {
DISCLAIMER=""
DISCLAIMER="${DISCLAIMER}_______________________________________________________\n\n"
DISCLAIMER="${DISCLAIMER}\n"
DISCLAIMER="${DISCLAIMER}TAMO+: Themes and Music Overlay Plus Script\n\n"
DISCLAIMER="${DISCLAIMER}The background music python and control scripts have been installed on this system.\n"
DISCLAIMER="${DISCLAIMER}This script will play MP3 & OGG files during menu navigation in either Emulation Station or Attract mode.\n"
DISCLAIMER="${DISCLAIMER}You can add subfolders to $HOME/RetroPie/roms/music directory for different music selections\n"
DISCLAIMER="${DISCLAIMER}Launch a game, the music will stop. Upon exiting out of the game the music will begin playing again.\n"
DISCLAIMER="${DISCLAIMER}This also lets you turn off certain options for BGM.py such as, Enable/Disable the Overlay, Fadeout effect,\n"
DISCLAIMER="${DISCLAIMER}Rounded Corners on Overlays, an option to turn the dashes, or hyphens, with a space on both sides\n"
DISCLAIMER="${DISCLAIMER}\" - \"\n"
DISCLAIMER="${DISCLAIMER}and separate the song title to separate new line(s).\n"
DISCLAIMER="${DISCLAIMER}\n"
DISCLAIMER="${DISCLAIMER}Overlay disappeared when you change resolutions? Set postion to Top-Left so you can see it,\n"
DISCLAIMER="${DISCLAIMER}then set it to desired postition, the overlay is compatible with all resolutions.\n"
DISCLAIMER="${DISCLAIMER}\n"
DISCLAIMER="${DISCLAIMER}This is a bare TAMO+ script, and does not contain presets for theme sets or music.\n"
DISCLAIMER="${DISCLAIMER}Also does not contain themes or music, Just tools from links below.\n"
DISCLAIMER="${DISCLAIMER}\n"
DISCLAIMER="${DISCLAIMER}https://github.com/ALLRiPPED/tamoplus\n"
DISCLAIMER="${DISCLAIMER}https://github.com/SupremePi/tamoplus\n"
dialog --colors --backtitle "TAMO+ Control Script $ver" \
--title "DISCLAIMER" \
--msgbox "${DISCLAIMER}" 35 110
}

main_menu
