#!/bin/bash
# updater.sh
# Updated script by Chad "thepitster" Ward https://github.com/ALLRiPPED/ 
# & The Supreme Team https://github.com/SupremePi/
#############################################
# Update Themes and Music Overlay Plus
#############################################
currentuser=$(whoami) # Check user
. /home/$currentuser/tamoplus/scripts/tamo-vars

tamo_update() {
	tamoscriptupdate() {
	chmod 0755 /home/pi/tamoplus/scripts/*
	chmod 0755 /home/pi/tamoplus/files/*.sh
	chmod 0755 /home/pi/tamoplus/files/pngview
	chmod 0755 /home/pi/tamoplus/files/*.py
	sudo chown pi:pi $MENU_DIR/*
	sudo chmod +x $USER_SETTINGS
	cp -f $INSTALL_DIR/files/tamoplus.sh $MENU_DIR/tamoplus.sh
	echo -e "$(tput setaf 2)TAMO+ Updated$(tput setaf 0)"
	sleep 2
	}

if [ -d "$INSTALL_DIR" ]; then
	cd $INSTALL_DIR
	git reset --hard
	git pull
	tamoscriptupdate
	bash $MENU_DIR/tamoplus.sh
	exit 1
else
	echo -e "$(tput setaf 2)Please Install TAMO+ First! $(tput setaf 0)"
	sleep 5
	exit 1
fi
}

. /home/$currentuser/tamoplus/scripts/tamo-functions

tamo_update
