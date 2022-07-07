#!/bin/bash
#IFS=';'
enable="\Z2Enabled\Zn"
disable="\Z1Disabled\Zn"
RUNONSTART="/opt/retropie/configs/all/runcommand-onstart.sh"
if grep -q 'enablevideolaunch="true"' "$RUNONSTART"; then vls=enable; else vls=disable; fi

# Welcome
 dialog --backtitle "RetroPie Media Utility" --title "RetroPie Launching Media Utility Menu" \
    --yesno "\nRetroPie Launching Media Utility menu.\n\nThis utility will let you quickly install or remove launching/loading media.\n\nLaunching media files that are shown for a few seconds after you initally launch a game.\n\nThey are shown for a few seconds and then the game will start.\n\n\n\nDo you want to proceed?" \
    20 80 2>&1 > /dev/tty \
    || exit

function main_menu() {
    clear
    local choice
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title "LAUNCHING MEDIA UTILITY MENU" \
            --ok-label OK --cancel-label Back \
            --menu "What option would you like to apply ?" 25 75 20 \
            - "*** LAUNCHING SCREENS SELECTION ***" \
            1 "Install launching screens" \
            2 "Remove launching screens" \
            3 "Download launching screens" \
	    - "" \
	    - "*** LAUNCHING VIDEOS SELECTION ***" \
            4 "Enable/Disable videoloadingscreens ($vls) " \

	   2>&1 > /dev/tty)

        case "$choice" in
            1) install_screens  ;;
            2) remove_screens  ;;
            3) download_screens  ;;
            4) video_screens  ;;
	    -) none  ;;
            *)  break ;;
        esac
    done
}

function install_screens() {

FILE=""
DIR="/home/pi/RetroPie/LaunchingScreens"
	if [ "$(ls -A $DIR)" ]; then

ls /home/pi/RetroPie/LaunchingScreens |grep -v README > /tmp/displays

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

if [[ ! -d "/home/pi/RetroPie/LaunchingScreens" ]]; then
mkdir -p "/home/pi/RetroPie/LaunchingScreens"
fi

if [[ -f "/opt/retropie/configs/*/launching.png" ]]; then
rm /opt/retropie/configs/*/launching.png
fi
 
if [[ -f "/opt/retropie/configs/*/launching.jpg" ]]; then
rm /opt/retropie/configs/*/launching.jpg
fi

if [[ -f "/tmp/displays" ]]; then
currentdisplay=`sed -n ${CONFDISP}p /tmp/displays`
cp -r /home/pi/RetroPie/LaunchingScreens/${currentdisplay}/* /opt/retropie/configs
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

if [[ ! -d "/home/pi/RetroPie/LaunchingScreens" ]]; then
mkdir -p "/home/pi/RetroPie/LaunchingScreens"
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
    rm -rf "/home/pi/RetroPie/LaunchingScreens/$theme"
    mkdir -p "/home/pi/RetroPie/LaunchingScreens"
    git clone "https://github.com/$repo/launchingscreens-$theme.git" "/home/pi/RetroPie/LaunchingScreens/$theme"
    echo -e "$(tput setaf 2)Done. $(tput sgr0)"
    sleep 3
}

function uninstall_launching_screens() {
    local theme="$1"
    if [[ -d "/home/pi/RetroPie/LaunchingScreens/$theme" ]]; then
        rm -rf "/home/pi/RetroPie/LaunchingScreens/$theme"
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
            if [[ -d "/home/pi/RetroPie/LaunchingScreens/$theme" ]]; then
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
                cd "/home/pi/RetroPie/retropiemenu" 
                mv "launchingscreens.sh" "launchingscreens.sh.bkp" 
                wget "https://raw.githubusercontent.com/SupremePi/LaunchingScreens/master/launchingscreens.sh" 
                chmod 777 "launchingscreens.sh" 
                exit
                ;;
            *)  #install or update themes
                theme=(${themes[choice-1]})
                repo="${theme[0]}"
                theme="${theme[1]}"
#                if [[ "${status[choice]}" == "i" ]]; then
                if [[ -d "/home/pi/RetroPie/LaunchingScreens/$theme" ]]; then
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

video_screens() {
if grep -q 'enablevideolaunch="true"' "$RUNONSTART"; then sed -i -E 's|enablevideolaunch="true"|enablevideolaunch="false"|g' $RUNONSTART
else sed -i -E 's|enablevideolaunch="false"|enablevideolaunch="true"|g' $RUNONSTART; fi
}

main_menu
