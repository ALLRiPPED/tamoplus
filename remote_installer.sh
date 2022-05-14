#!/bin/bash
# remote_installer.sh
# Updated script by Chad "thepitster" Ward https://github.com/ALLRiPPED/ 
# & The Supreme Team https://github.com/SupremePi/
#############################################
# Install Themes and Music Overlay Plus
#############################################
ver="v1.31"
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
	exit
fi

get_tamoplus() {
if [ -d "$INSTALL_DIR" ]; then 
	cd $INSTALL_DIR
	git reset --hard
	git pull
	echo "TAMO+ Updated"
	sleep 1
else
	cd $HOME
	git clone https://github.com/ALLRiPPED/tamoplus.git
	echo "TAMO+ Downloaded"
	sleep 1
fi

sudo chmod +x $INSTALL_DIR/*.sh
echo "Installing TAMO+"
sleep 1
cd $HOME/tamoplus
bash local_installer.sh
exit
}

get_tamoplus
