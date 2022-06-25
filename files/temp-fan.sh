#!/bin/bash
ontemp=40
temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
echo $temp #use BCM pin 14 for Ice Tower
temp0=${temp%.*}
echo $temp0

if [ $temp0 -gt $ontemp ]
then
        echo greater than $ontemp fan on
        raspi-gpio set 14 op dh
else
        echo less than or equal to  $ontemp fan off
        raspi-gpio set 14 op dl
fi
