#!/bin/bash

# calculate rough CPU and GPU temperatures:
cpuTempC=""
cpuTempF=""
gpuTempC=""
gpuTempF=""
if [[ -f "/sys/class/thermal/thermal_zone0/temp" ]]; then
    cpuTempC=$(($(cat /sys/class/thermal/thermal_zone0/temp)/1000)) && cpuTempF=$((cpuTempC*9/5+32))
fi

if [[ -f "/opt/vc/bin/vcgencmd" ]]; then
    if gpuTempC=$(/opt/vc/bin/vcgencmd measure_temp); then
        gpuTempC=${gpuTempC:5:2}
        gpuTempF=$((gpuTempC*9/5+32))
    else
        gpuTempC=""
    fi
fi


infobox="${infobox}"
infobox="${infobox}\n$(date)\n"
infobox="${infobox}_______________________________________________________\n\n"
infobox="${infobox}Temperature\n\n"
infobox="${infobox}CPU: ${cpuTempC} C/${cpuTempF} F\n"
infobox="${infobox}GPU: ${gpuTempC} C/${gpuTempF} F\n"
infobox="${infobox}\n"
sdcard1=`df -h|head -2|grep -v G|awk '{print $1,"     "$2,"  "$3," "$4," "$5}'`
sdcard2=`df -h|grep '/dev/sda1'|awk '{print "Boot            "$2,"  "$3,"  "$4,"  "$5}'`
sdcard3=`df -h|grep '/dev/root'|awk '{print "Root            "$2,"  "$3,"   "$4,"  "$5}'`
infobox="${infobox}SD Card Information\n\n"
infobox="${infobox}${sdcard1}\n"
infobox="${infobox}${sdcard2}\n"
infobox="${infobox}${sdcard3}\n\n"
infobox="${infobox}IP Address Information\n\n"
infobox="${infobox}LAN: $(ip route get 8.8.8.8 2>/dev/null | awk '{print $(NF-2); exit}')\n"
infobox="${infobox}WAN: $(curl -4 icanhazip.com 2>/dev/null | awk '{print $NF; exit}')\n"

dialog --backtitle "System Information" \
--title "RetroPie System Information" \
--msgbox "${infobox}" 25 60
