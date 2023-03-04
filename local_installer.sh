#!/bin/bash
# local_installer.sh
# Updated script by Chad "thepitster" Ward https://github.com/ALLRiPPED/
# & The Supreme Team https://github.com/SupremePi/

export NCURSES_NO_UTF8_ACS=1

INSTALL_DIR="$HOME/tamoplus"
rpi=$(cat /proc/device-tree/model |awk '{print $3}')

if [ "$rpi" = "3" ]; then
sudo chmod +x $INSTALL_DIR/*.sh
echo "Installing TAMO+"
sleep 1
cd $HOME/tamoplus
bash pi3_installer.sh
exit
elif [ "$rpi" = "4" ]; then
sudo chmod +x $INSTALL_DIR/*.sh
echo "Installing TAMO+"
sleep 1
cd $HOME/tamoplus
bash pi4_installer.sh
exit
else
echo -e "$(tput setaf 2)Sorry but atm it looks like your device is not supported! $(tput sgr0)"
sleep 3
fi
