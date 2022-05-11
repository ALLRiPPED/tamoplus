#!/bin/bash
# TAMO+ Font Color Selection
currentuser=$(whoami) # Check user
. /home/$currentuser/tamoplus/scripts/tamo-vars

font_color_selection() {
stats_check
local choice
    while true; do
        choice=$(dialog --colors --backtitle "Font Color Selection" --title " Font Color Selection " \
            --ok-label OK --cancel-label Back \
            --menu "Choose Color, Current Font Color $ccolor" 25 85 20 \
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
           001) font_color_change "brown" ;;
           002) font_color_change "RosyBrown" ;;
           003) font_color_change "SaddleBrown" ;;
           004) font_color_change "SandyBrown" ;;
           005) font_color_change "LightCoral" ;;
           006) font_color_change "firebrick" ;;
           007) font_color_change "blue" ;;
           008) font_color_change "LightBlue" ;;
           009) font_color_change "MediumBlue" ;;
           010) font_color_change "PowderBlue" ;;
           011) font_color_change "SkyBlue" ;;
           012) font_color_change "LightSkyBlue" ;;
           013) font_color_change "DeepSkyBlue" ;;
           014) font_color_change "NavyBlue" ;;
           015) font_color_change "RoyalBlue" ;;
           016) font_color_change "CadetBlue" ;;
           017) font_color_change "CornflowerBlue" ;;
           018) font_color_change "LightSteelBlue" ;;
           019) font_color_change "DodgerBlue" ;;
           020) font_color_change "AliceBlu" ;;
           021) font_color_change "SteelBlue" ;;
           022) font_color_change "BlueViolet" ;;
           023) font_color_change "DarkSlateBlue" ;;
           024) font_color_change "LightSlateBlue" ;;
           025) font_color_change "MediumSlateBlue" ;;
           026) font_color_change "SlateBlue" ;;
           027) font_color_change "red" ;;
           028) font_color_change "IndianRed" ;;
           029) font_color_change "DarkRed" ;;
           030) font_color_change "PaleVioletRed" ;;
           031) font_color_change "VioletRed" ;;
           032) font_color_change "MediumVioletRed" ;;
           033) font_color_change "OrangeRed" ;;
           034) font_color_change "orange" ;;
           035) font_color_change "DarkOrange" ;;
           036) font_color_change "gray" ;;
           037) font_color_change "DimGray" ;;
           038) font_color_change "SlateGray" ;;
           039) font_color_change "LightSlateGray" ;;
           040) font_color_change "DarkSlateGray" ;;
           041) font_color_change "maroon" ;;
           042) font_color_change "LightPink" ;;
           043) font_color_change "HotPink" ;;
           044) font_color_change "DeepPink" ;;
           045) font_color_change "pink" ;;
           046) font_color_change "purple" ;;
           047) font_color_change "lavender" ;;
           048) font_color_change "LavenderBlush" ;;
           049) font_color_change "violet" ;;
           050) font_color_change "DarkViolet" ;;
           051) font_color_change "orchid" ;;
           052) font_color_change "DarkOrchid" ;;
           053) font_color_change "MediumOrchid" ;;
           054) font_color_change "thistle" ;;
           055) font_color_change "plum" ;;
           056) font_color_change "fuchsia" ;;
           057) font_color_change "magenta" ;;
           058) font_color_change "DarkMagenta" ;;
           059) font_color_change "indigo" ;;
           060) font_color_change "MediumPurple" ;;
           061) font_color_change "turquoise" ;;
           062) font_color_change "PaleTurquoise" ;;
           063) font_color_change "MediumTurquoise" ;;
           064) font_color_change "DarkTurquoise" ;;
           065) font_color_change "azure" ;;
           066) font_color_change "LightCyan" ;;
           067) font_color_change "DarkCyan" ;;
           068) font_color_change "teal" ;;
           069) font_color_change "aqua" ;;
           070) font_color_change "aquamarine" ;;
           071) font_color_change "MediumAquamarine" ;;
           072) font_color_change "SeaGreen" ;;
           073) font_color_change "LightSeaGreen" ;;
           074) font_color_change "MediumSeaGreen" ;;
           075) font_color_change "DarkSeaGreen" ;;
           076) font_color_change "SpringGreen" ;;
           077) font_color_change "MediumSpringGreen" ;;
           078) font_color_change "MintCream" ;;
           079) font_color_change "ForestGreen" ;;
           080) font_color_change "MediumForestGreen" ;;
           081) font_color_change "honeydew" ;;
           082) font_color_change "PaleGreen" ;;
           083) font_color_change "LightGreen" ;;
           084) font_color_change "DarkGreen" ;;
           085) font_color_change "lime" ;;
           086) font_color_change "LimeGreen" ;;
           087) font_color_change "LawnGreen" ;;
           088) font_color_change "chartreuse" ;;
           089) font_color_change "GreenYellow" ;;
           090) font_color_change "olive" ;;
           091) font_color_change "DarkOliveGreen" ;;
           092) font_color_change "OliveDrab" ;;
           093) font_color_change "ivory" ;;
           094) font_color_change "LightYellow" ;;
           095) font_color_change "beige" ;;
           096) font_color_change "LightGoldenrodYellow" ;;
           097) font_color_change "goldenrod" ;;
           098) font_color_change "LightGoldenrod" ;;
           099) font_color_change "MediumGoldenRod" ;;
           100) font_color_change "DarkGoldenrod" ;;
           101) font_color_change "LemonChiffon" ;;
           102) font_color_change "yellow" ;;
           103) font_color_change "DarkKhaki" ;;
           104) font_color_change "khaki" ;;
           105) font_color_change "gold" ;;
           106) font_color_change "cornsilk" ;;
           107) font_color_change "FloralWhite" ;;
           108) font_color_change "OldLace" ;;
           109) font_color_change "wheat" ;;
           110) font_color_change "moccasin" ;;
           111) font_color_change "PapayaWhip" ;;
           112) font_color_change "NavajoWhite" ;;
           113) font_color_change "BlanchedAlmond" ;;
           114) font_color_change "AntiqueWhite" ;;
           115) font_color_change "tan" ;;
           116) font_color_change "bisque" ;;
           117) font_color_change "burlywood" ;;
           118) font_color_change "linen" ;;
           119) font_color_change "peru" ;;
           120) font_color_change "PeachPuff" ;;
           121) font_color_change "seashell" ;;
           122) font_color_change "chocolate" ;;
           123) font_color_change "seashell" ;;
           124) font_color_change "salmon" ;;
           125) font_color_change "LightSalmon" ;;
           126) font_color_change "DarkSalmon" ;;
           127) font_color_change "coral" ;;
           128) font_color_change "tomato" ;;
           129) font_color_change "MistyRose" ;;
           130) font_color_change "snow" ;;
           131) font_color_change "white" ;;
           132) font_color_change "GhostWhite" ;;
           133) font_color_change "WhiteSmoke" ;;
           134) font_color_change "Black" ;;
             *) break ;;
        esac
    done
}

font_color_change() {
CUR_COLOR=$(grep "overlay_text_color =" "${SCRIPT_LOC}"|awk '{print $3}')
export CUR_COLOR
sed -i -E "s/overlay_text_color = ${CUR_COLOR}/overlay_text_color = \"${1}\"/g" $SCRIPT_LOC
bgm_check
stats_check
}

stats_check() {
CURCOLOR=$(grep "overlay_text_color =" "$SCRIPT_LOC"|awk '{print $3}' | tr -d '"')
ccolor="\Z3$CURCOLOR\Zn"
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
