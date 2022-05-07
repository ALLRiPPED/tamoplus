#!/bin/bash
# remote_installer.sh
# Updated script by Chad "thepitster" Ward https://github.com/ALLRiPPED/ 
# & The Supreme Team https://github.com/SupremePi/
#############################################
# Install Themes and Music Overlay Plus
#############################################
ver="v1.25"
INSTALL_DIR="$HOME/tamoplus"

cd $HOME
currentuser=$(whoami) # Check user and then stop the script if root
if [[ $currentuser == "root" ]]; then echo "DON'T RUN THIS SCRIPT AS ROOT! USE './local_installer.sh' !"; exit; fi

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

get_tamoplus() {
if [ -d "$INSTALL_DIR" ]; then 
	cd $INSTALL_DIR
	git reset --hard
	git pull
	echo -e "$(tput setaf 2)TAMO+ Updated$(tput setaf 0)"
	sleep 1
else
	cd $HOME
	git clone --branch https://github.com/ALLRiPPED/tamoplus.git
	echo -e "$(tput setaf 2)TAMO+ Downloaded$(tput setaf 0)"
	sleep 1
fi

sudo chmod +x $INSTALL_DIR/local_installer.sh
echo -e "$(tput setaf 2)Installing TAMO+$(tput setaf 0)"
sleep 1
bash "$INSTALL_DIR/local_installer.sh"
exit 1
}

get_tamoplus
