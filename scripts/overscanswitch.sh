#!/bin/bash
# OverScan On/Off Switch

infobox=""
infobox="${infobox}\n"
infobox="${infobox}OverScan On/Off\n\n"
infobox="${infobox}\n"
infobox="${infobox}This script will disable or enable the OverScan.\n"
infobox="${infobox}\n"
infobox="${infobox}\n\n"
infobox="${infobox}**Enable**\nWhen you select the Enable option, the overscan is enabled"
infobox="${infobox}\n"
infobox="${infobox}**Disable**\nwhen you select the Disable option, the overscan is disabled\n"
infobox="${infobox}\n"
infobox="${infobox}\n"

dialog --backtitle "OverScan On/Off Switch" \
--title "OverScan On/Off Switch !" \
--msgbox "${infobox}" 35 110

function main_menu() {
if grep -q '#disable_overscan=1' "/boot/config.txt"; then ovscn="Enabled"; ovscn2="Disable"; else ovscn="Disabled"; ovscn2="Enable"; fi

    local choice
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Overscan is now $ovscn, What would you like to $ovscn2 it?" 25 75 20 \
            1 "$ovscn2 Overscan " \
            2>&1 > /dev/tty)

        case "$choice" in
            1) overscan_toggle ;;
            *) break ;;
        esac
    done
}

overscan_toggle() {
dialog --infobox "...Removing..." 3 20 ; sleep 2
# check for normal overscan settings
if grep -q '#disable_overscan=1' "/boot/config.txt"; then
sudo perl -p -i -e 's/#disable_overscan=1/disable_overscan=1/g' /boot/config.txt
else sudo perl -p -i -e 's/disable_overscan=1/#disable_overscan=1/g' /boot/config.txt; fi
# check for other overscan settings
if grep -q '#disable_overscan=0' "/boot/config.txt"; then sudo perl -p -i -e 's/#disable_overscan=0/disable_overscan=1/g' /boot/config.txt
elif grep -q 'disable_overscan=0' "/boot/config.txt"; then sudo perl -p -i -e 's/disable_overscan=0/disable_overscan=1/g' /boot/config.txt; fi


echo "Your Retropie is about to reboot so that the settings take effect!"
sleep 3
sudo reboot
}

main_menu
