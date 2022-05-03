#!/bin/bash
# Updater.sh
# Updated script by Chad "thepitster" Ward https://github.com/ALLRiPPED/ 
# & The Supreme Team https://github.com/SupremePi/
#############################################
# Update Themes and Music Overlay Plus
#############################################
INSTALL_DIR="$HOME/tamoplus"
MENU_DIR="$HOME/RetroPie/retropiemenu"

update_tamo() {
	tamoscriptupdate() {
	if grep -q "TAMO+ Full Script" "$MENU_DIR/tamoplus.sh"; then
		cp -f $INSTALL_DIR/tamoplus.sh $MENU_DIR/tamoplus.sh
	elif grep -q "TAMO+ Minimal Script" "$MENU_DIR/tamoplus.sh"; then
		cp -f $INSTALL_DIR/tamoplus-minimum.sh $MENU_DIR/tamoplus.sh
	elif grep -q "TAMO+ Bare Script" "$MENU_DIR/tamoplus.sh"; then
		cp -f $INSTALL_DIR/tamoplus-bare.sh $MENU_DIR/tamoplus.sh
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
	git clone --depth=1 https://github.com/ALLRiPPED/tamoplus.git
	cd $INSTALL_DIR
	tamoscriptupdate
	bash $MENU_DIR/tamoplus.sh
	exit 1
fi
}

update_tamo