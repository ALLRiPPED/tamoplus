#!/bin/bash
# TAMO+ Overlay Color Selection
currentuser=$(whoami) # Check user
. /home/$currentuser/tamoplus/scripts/tamo-vars

font_color_selection() {
stats_check
local choice
    while true; do
        choice=$(dialog --colors --backtitle "Overlay Color Selection" --title " Overlay Color Selection " \
            --ok-label OK --cancel-label Back \
            --menu "Choose Color, Current Overlay Color $ocolor" 25 85 20 \
           001 "Brown" \
           002 "RosyBrown" \
           003 "SaddleBrown" \
           004 "SandyBrown" \
           005 "LightCoral" \
           006 "Firebrick" \
           007 "Blue" \
           008 "LightBlue" \
           009 "MediumBlue" \
           010 "PowderBlue" \
           011 "SkyBlue" \
           012 "LightSkyBlue" \
           013 "DeepSkyBlue" \
           014 "NavyBlue" \
           015 "RoyalBlue" \
           016 "CadetBlue" \
           017 "CornflowerBlue" \
           018 "LightSteelBlue" \
           019 "DodgerBlue" \
           020 "AliceBlue" \
           021 "SteelBlue" \
           022 "BlueViolet" \
           023 "DarkSlateBlue" \
           024 "LightSlateBlue" \
           025 "MediumSlateBlue" \
           026 "SlateBlue" \
           027 "Red" \
           028 "IndianRed" \
           029 "DarkRed" \
           030 "PaleVioletRed" \
           031 "VioletRed" \
           032 "MediumVioletRed" \
           033 "OrangeRed" \
           034 "Orange" \
           035 "DarkOrange" \
           036 "Gray" \
           037 "DimGray" \
           038 "SlateGray" \
           039 "LightSlateGray" \
           040 "DarkSlateGray" \
           041 "Maroon" \
           042 "LightPink" \
           043 "HotPink" \
           044 "DeepPink" \
           045 "Pink" \
           046 "Purple" \
           047 "Lavender" \
           048 "LavenderBlush" \
           049 "Violet" \
           050 "DarkViolet" \
           051 "Orchid" \
           052 "DarkOrchid" \
           053 "MediumOrchid" \
           054 "Thistle" \
           055 "Plum" \
           056 "Fuchsia" \
           057 "Magenta" \
           058 "DarkMagenta" \
           059 "Indigo" \
           060 "MediumPurple" \
           061 "Turquoise" \
           062 "PaleTurquoise" \
           063 "MediumTurquoise" \
           064 "DarkTurquoise" \
           065 "Azure" \
           066 "LightCyan" \
           067 "DarkCyan" \
           068 "Teal" \
           069 "Aqua" \
           070 "Aquamarine" \
           071 "MediumAquamarine" \
           072 "SeaGreen" \
           073 "LightSeaGreen" \
           074 "MediumSeaGreen" \
           075 "DarkSeaGreen" \
           076 "SpringGreen" \
           077 "MediumSpringGreen" \
           078 "MintCream" \
           079 "ForestGreen" \
           080 "MediumForestGreen" \
           081 "honeydew" \
           082 "PaleGreen" \
           083 "LightGreen" \
           084 "DarkGreen" \
           085 "Lime" \
           086 "LimeGreen" \
           087 "LawnGreen" \
           088 "Chartreuse" \
           089 "GreenYellow" \
           090 "Olive" \
           091 "DarkOliveGreen" \
           092 "OliveDrab" \
           093 "Ivory" \
           094 "LightYellow" \
           095 "Beige" \
           096 "LightGoldenrodYellow" \
           097 "Goldenrod" \
           098 "LightGoldenrod" \
           099 "MediumGoldenRod" \
           100 "DarkGoldenrod" \
           101 "LemonChiffon" \
           102 "Yellow" \
           103 "DarkKhaki" \
           104 "Khaki" \
           105 "Gold" \
           106 "Cornsilk" \
           107 "FloralWhite" \
           108 "OldLace" \
           109 "Wheat" \
           110 "Moccasin" \
           111 "PapayaWhip" \
           112 "NavajoWhite" \
           113 "BlanchedAlmond" \
           114 "AntiqueWhite" \
           115 "Tan" \
           116 "Bisque" \
           117 "Burlywood" \
           118 "Linen" \
           119 "Peru" \
           120 "PeachPuff" \
           121 "Seashell" \
           122 "Chocolate" \
           123 "Sienna" \
           124 "Salmon" \
           125 "LightSalmon" \
           126 "DarkSalmon" \
           127 "Coral" \
           128 "Tomato" \
           129 "MistyRose" \
           130 "Snow" \
           131 "White" \
           132 "GhostWhite" \
           133 "WhiteSmoke" \
           134 "Black" \
		   2>&1 > /dev/tty)
        case "$choice" in
           001) overlay_color_change "brown" ;;
           002) overlay_color_change "RosyBrown" ;;
           003) overlay_color_change "SaddleBrown" ;;
           004) overlay_color_change "SandyBrown" ;;
           005) overlay_color_change "LightCoral" ;;
           006) overlay_color_change "firebrick" ;;
           007) overlay_color_change "blue" ;;
           008) overlay_color_change "LightBlue" ;;
           009) overlay_color_change "MediumBlue" ;;
           010) overlay_color_change "PowderBlue" ;;
           011) overlay_color_change "SkyBlue" ;;
           012) overlay_color_change "LightSkyBlue" ;;
           013) overlay_color_change "DeepSkyBlue" ;;
           014) overlay_color_change "NavyBlue" ;;
           015) overlay_color_change "RoyalBlue" ;;
           016) overlay_color_change "CadetBlue" ;;
           017) overlay_color_change "CornflowerBlue" ;;
           018) overlay_color_change "LightSteelBlue" ;;
           019) overlay_color_change "DodgerBlue" ;;
           020) overlay_color_change "AliceBlu" ;;
           021) overlay_color_change "SteelBlue" ;;
           022) overlay_color_change "BlueViolet" ;;
           023) overlay_color_change "DarkSlateBlue" ;;
           024) overlay_color_change "LightSlateBlue" ;;
           025) overlay_color_change "MediumSlateBlue" ;;
           026) overlay_color_change "SlateBlue" ;;
           027) overlay_color_change "red" ;;
           028) overlay_color_change "IndianRed" ;;
           029) overlay_color_change "DarkRed" ;;
           030) overlay_color_change "PaleVioletRed" ;;
           031) overlay_color_change "VioletRed" ;;
           032) overlay_color_change "MediumVioletRed" ;;
           033) overlay_color_change "OrangeRed" ;;
           034) overlay_color_change "orange" ;;
           035) overlay_color_change "DarkOrange" ;;
           036) overlay_color_change "gray" ;;
           037) overlay_color_change "DimGray" ;;
           038) overlay_color_change "SlateGray" ;;
           039) overlay_color_change "LightSlateGray" ;;
           040) overlay_color_change "DarkSlateGray" ;;
           041) overlay_color_change "maroon" ;;
           042) overlay_color_change "LightPink" ;;
           043) overlay_color_change "HotPink" ;;
           044) overlay_color_change "DeepPink" ;;
           045) overlay_color_change "pink" ;;
           046) overlay_color_change "purple" ;;
           047) overlay_color_change "lavender" ;;
           048) overlay_color_change "LavenderBlush" ;;
           049) overlay_color_change "violet" ;;
           050) overlay_color_change "DarkViolet" ;;
           051) overlay_color_change "orchid" ;;
           052) overlay_color_change "DarkOrchid" ;;
           053) overlay_color_change "MediumOrchid" ;;
           054) overlay_color_change "thistle" ;;
           055) overlay_color_change "plum" ;;
           056) overlay_color_change "fuchsia" ;;
           057) overlay_color_change "magenta" ;;
           058) overlay_color_change "DarkMagenta" ;;
           059) overlay_color_change "indigo" ;;
           060) overlay_color_change "MediumPurple" ;;
           061) overlay_color_change "turquoise" ;;
           062) overlay_color_change "PaleTurquoise" ;;
           063) overlay_color_change "MediumTurquoise" ;;
           064) overlay_color_change "DarkTurquoise" ;;
           065) overlay_color_change "azure" ;;
           066) overlay_color_change "LightCyan" ;;
           067) overlay_color_change "DarkCyan" ;;
           068) overlay_color_change "teal" ;;
           069) overlay_color_change "aqua" ;;
           070) overlay_color_change "aquamarine" ;;
           071) overlay_color_change "MediumAquamarine" ;;
           072) overlay_color_change "SeaGreen" ;;
           073) overlay_color_change "LightSeaGreen" ;;
           074) overlay_color_change "MediumSeaGreen" ;;
           075) overlay_color_change "DarkSeaGreen" ;;
           076) overlay_color_change "SpringGreen" ;;
           077) overlay_color_change "MediumSpringGreen" ;;
           078) overlay_color_change "MintCream" ;;
           079) overlay_color_change "ForestGreen" ;;
           080) overlay_color_change "MediumForestGreen" ;;
           081) overlay_color_change "honeydew" ;;
           082) overlay_color_change "PaleGreen" ;;
           083) overlay_color_change "LightGreen" ;;
           084) overlay_color_change "DarkGreen" ;;
           085) overlay_color_change "lime" ;;
           086) overlay_color_change "LimeGreen" ;;
           087) overlay_color_change "LawnGreen" ;;
           088) overlay_color_change "chartreuse" ;;
           089) overlay_color_change "GreenYellow" ;;
           090) overlay_color_change "olive" ;;
           091) overlay_color_change "DarkOliveGreen" ;;
           092) overlay_color_change "OliveDrab" ;;
           093) overlay_color_change "ivory" ;;
           094) overlay_color_change "LightYellow" ;;
           095) overlay_color_change "beige" ;;
           096) overlay_color_change "LightGoldenrodYellow" ;;
           097) overlay_color_change "goldenrod" ;;
           098) overlay_color_change "LightGoldenrod" ;;
           099) overlay_color_change "MediumGoldenRod" ;;
           100) overlay_color_change "DarkGoldenrod" ;;
           101) overlay_color_change "LemonChiffon" ;;
           102) overlay_color_change "yellow" ;;
           103) overlay_color_change "DarkKhaki" ;;
           104) overlay_color_change "khaki" ;;
           105) overlay_color_change "gold" ;;
           106) overlay_color_change "cornsilk" ;;
           107) overlay_color_change "FloralWhite" ;;
           108) overlay_color_change "OldLace" ;;
           109) overlay_color_change "wheat" ;;
           110) overlay_color_change "moccasin" ;;
           111) overlay_color_change "PapayaWhip" ;;
           112) overlay_color_change "NavajoWhite" ;;
           113) overlay_color_change "BlanchedAlmond" ;;
           114) overlay_color_change "AntiqueWhite" ;;
           115) overlay_color_change "tan" ;;
           116) overlay_color_change "bisque" ;;
           117) overlay_color_change "burlywood" ;;
           118) overlay_color_change "linen" ;;
           119) overlay_color_change "peru" ;;
           120) overlay_color_change "PeachPuff" ;;
           121) overlay_color_change "seashell" ;;
           122) overlay_color_change "chocolate" ;;
           123) overlay_color_change "seashell" ;;
           124) overlay_color_change "salmon" ;;
           125) overlay_color_change "LightSalmon" ;;
           126) overlay_color_change "DarkSalmon" ;;
           127) overlay_color_change "coral" ;;
           128) overlay_color_change "tomato" ;;
           129) overlay_color_change "MistyRose" ;;
           130) overlay_color_change "snow" ;;
           131) overlay_color_change "white" ;;
           132) overlay_color_change "GhostWhite" ;;
           133) overlay_color_change "WhiteSmoke" ;;
           134) overlay_color_change "Black" ;;
             *) break ;;
        esac
    done
}

overlay_color_change() {
CUR_COLOR=$(grep "overlay_background_color =" "${SCRIPT_LOC}"|awk '{print $3}')
export CUR_COLOR
sed -i -E "s/overlay_background_color = ${CUR_COLOR}/overlay_background_color = \"${1}\"/g" $SCRIPT_LOC
bgm_check
stats_check
}

stats_check() {
OVLCOLOR=$(grep "overlay_background_color =" "$SCRIPT_LOC"|awk '{print $3}' | tr -d '"')
ocolor="\Z3$OVLCOLOR\Zn"
}

bgm_check() {
if [ -f "$INSTALL_DIR"/DisableMusic ]; then
	echo "Background Music Disabled!"
else
	pgrep -f "BGM.py" |xargs sudo kill -9 > /dev/null 2>&1 &
	pgrep -f pngview|xargs sudo kill -9 > /dev/null 2>&1 &
	sleep 1
	(nohup python $SCRIPT_LOC > /dev/null 2>&1) &
fi
sleep 1
}

font_color_selection
