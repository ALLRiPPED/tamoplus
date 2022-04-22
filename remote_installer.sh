#!/bin/bash
# remote_installer.sh
# Updated script by Chad "thepitster" Ward https://github.com/ALLRiPPED/ 
# & The Supreme Team https://github.com/SupremePi/
#############################################
# Install Themes and Music Overlay Plus
#############################################
ver="v1.20"
INSTALL_DIR="$HOME/tamoplus"
cd $HOME

get_tamoplus() {
if [ -d "$HOME/tamoplus" ]; then
	cd $HOME/tamoplus
	git pull
	echo -e "$(tput setaf 2)TAMO+ Updated$(tput setaf 0)"
	sleep 1
else
	cd $HOME
	git clone --branch $ver https://github.com/ALLRiPPED/tamoplus.git
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