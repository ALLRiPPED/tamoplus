#!/bin/bash
readonly JOY2KEY_SCRIPT="$HOME/RetroPie-Setup/scriptmodules/helpers.sh"
readonly OPENBOR_ROMDIR="/home/pi/RetroPie/roms/ports/openbor"
[[ -e $JOY2KEY_SCRIPT ]] || (cd /opt/retropie/ports/openbor-6xxx; ./OpenBOR; kill $$)
sleep 0.5; sudo pkill -f joy2key
source "$JOY2KEY_SCRIPT"
scriptdir="$HOME/RetroPie-Setup"
for file in "$OPENBOR_ROMDIR/"*.[Pp][Aa][Kk]; do
  [[ -e $file ]] || continue
  filename="${file##*/}"; filename="${filename%.*}"
  darray+=("$file" "$filename")
done
if [[ ${#darray[@]} -gt 0 ]]; then
    joy2keyStart; sleep 0.2
    cmd=(dialog --backtitle " OpenBOR - The ultimate 2D gaming engine " --title " Module selection list " --no-tags --stdout --menu "Please select a module from list to get launched:" 16 75 16)
    choices=$("${cmd[@]}" "${darray[@]}")
    joy2keyStop; sleep 0.2
    [[ $choices ]] || exit  
fi
"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "openbor" "$choices"
