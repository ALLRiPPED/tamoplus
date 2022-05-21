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
	if grep -q "TAMO+ Full Script" "$MENU_DIR/tamoplus.sh"; then
		if ! cmp $INSTALL_DIR/files/tamoplus.sh $MENU_DIR/tamoplus.sh >/dev/null 2>&1; then
			cp -f $INSTALL_DIR/files/tamoplus.sh $MENU_DIR/tamoplus.sh; fi
	elif grep -q "TAMO+ Minimal Script" "$MENU_DIR/tamoplus.sh"; then
		if ! cmp $INSTALL_DIR/files/tamoplus-minimum.sh $MENU_DIR/tamoplus.sh >/dev/null 2>&1; then
			cp -f $INSTALL_DIR/files/tamoplus-minimum.sh $MENU_DIR/tamoplus.sh; fi
	elif grep -q "TAMO+ Bare Script" "$MENU_DIR/tamoplus.sh"; then
		if ! cmp $INSTALL_DIR/files/tamoplus-bare.sh $MENU_DIR/tamoplus.sh >/dev/null 2>&1; then
			cp -f $INSTALL_DIR/files/tamoplus-bare.sh $MENU_DIR/tamoplus.sh; fi
	fi
	echo -e "$(tput setaf 2)TAMO+ Updated$(tput setaf 0)"
	sleep 1
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
