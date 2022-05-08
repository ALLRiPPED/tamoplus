#!/bin/bash
# TAMO+ Font Selection
SCRIPT_LOC="$HOME/tamoplus/BGM.py"
INSTALL_DIR="$HOME/tamoplus"

font_selection() {
stats_check
local choice
    while true; do
        choice=$(dialog --colors --backtitle "Font Selection" --title " Font Selection " \
            --ok-label OK --cancel-label Back \
            --menu "Choose Font, Current Font $cfont" 25 85 20 \
            1 "DejaVuSans-Bold" \
            2 "DejaVuSansMono-Bold" \
            3 "DejaVuSansMono" \
            4 "DejaVuSans" \
            5 "DejaVuSerif-Bold" \
            6 "DejaVuSerif" \
            7 "DroidSansFallbackFull" \
            8 "FreeMonoBoldOblique" \
            9 "FreeMonoBold" \
           10 "FreeMonoOblique" \
           11 "FreeMono" \
           12 "FreeSansBoldOblique" \
           13 "FreeSansBold" \
           14 "FreeSansOblique" \
           15 "FreeSans" \
           16 "FreeSerifBoldItalic" \
           17 "FreeSerifBold" \
           18 "FreeSerifItalic" \
           19 "FreeSerif" \
           20 "GROBOLD" \
           21 "LiberationMono-BoldItalic" \
           22 "LiberationMono-Bold" \
           23 "LiberationMono-Italic" \
           24 "LiberationMono-Regular" \
           25 "LiberationSans-BoldItalic" \
           26 "LiberationSans-Bold" \
           27 "LiberationSans-Italic" \
           28 "LiberationSans-Regular" \
           29 "LiberationSansNarrow-BoldItalic" \
           30 "LiberationSansNarrow-Bold" \
           31 "LiberationSansNarrow-Italic" \
           32 "LiberationSansNarrow-Regular" \
           33 "LiberationSerif-BoldItalic" \
           34 "LiberationSerif-Bold" \
           35 "LiberationSerif-Italic" \
           36 "LiberationSerif-Regular" \
           37 "NotoMono-Regular" \
           38 "Piboto-BoldItalic" \
           39 "Piboto-Bold" \
           40 "PibotoCondensed-BoldItalic" \
           41 "PibotoCondensed-Bold" \
           42 "PibotoCondensed-Italic" \
           43 "PibotoCondensed-Regular" \
           44 "Piboto-Italic" \
           45 "Piboto-LightItalic" \
           46 "Piboto-Light" \
           47 "PibotoLtBoldItalic" \
           48 "PibotoLtBold" \
           49 "PibotoLtItalic" \
           50 "PibotoLt-Regular" \
           51 "Piboto-Regular" \
           52 "Piboto-ThinItalic" \
           53 "Piboto-Thin" \
           54 "Pixel" \
           55 "Quicksand-Bold" \
           56 "Quicksand-Light" \
           57 "Quicksand-Medium" \
           58 "Quicksand-Regular" \
           59 "TakaoGothic" \
           60 "TakaoPGothic" \
		   2>&1 > /dev/tty)
        case "$choice" in
            1) font_change "DejaVuSans\-Bold" ;;
            2) font_change "DejaVuSansMono\-Bold" ;;
            3) font_change "DejaVuSansMono" ;;
            4) font_change "DejaVuSans" ;;
            5) font_change "DejaVuSerif\-Bold" ;;
            6) font_change "DejaVuSerif" ;;
            7) font_change "DroidSansFallbackFull" ;;
            8) font_change "FreeMonoBoldOblique" ;;
            9) font_change "FreeMonoBold" ;;
           10) font_change "FreeMonoOblique" ;;
           11) font_change "FreeMono" ;;
           12) font_change "FreeSansBoldOblique" ;;
           13) font_change "FreeSansBold" ;;
           14) font_change "FreeSansOblique" ;;
           15) font_change "FreeSans" ;;
           16) font_change "FreeSerifBoldItalic" ;;
           17) font_change "FreeSerifBold" ;;
           18) font_change "FreeSerifItalic" ;;
           19) font_change "FreeSerif" ;;
           20) font_change "GROBOLD" ;;
           21) font_change "LiberationMono\-BoldItalic" ;;
           22) font_change "LiberationMono\-Bold" ;;
           23) font_change "LiberationMono\-Italic" ;;
           24) font_change "LiberationMono\-Regular" ;;
           25) font_change "LiberationSans\-BoldItalic" ;;
           26) font_change "LiberationSans\-Bold" ;;
           27) font_change "LiberationSans\-Italic" ;;
           28) font_change "LiberationSans\-Regular" ;;
           29) font_change "LiberationSansNarrow\-BoldItalic" ;;
           30) font_change "LiberationSansNarrow\-Bold" ;;
           31) font_change "LiberationSansNarrow\-Italic" ;;
           32) font_change "LiberationSansNarrow\-Regular" ;;
           33) font_change "LiberationSerif\-BoldItalic" ;;
           34) font_change "LiberationSerif\-Bold" ;;
           35) font_change "LiberationSerif\-Italic" ;;
           36) font_change "LiberationSerif\-Regular" ;;
           37) font_change "NotoMono\-Regular" ;;
           38) font_change "Piboto\-BoldItalic" ;;
           39) font_change "Piboto\-Bold" ;;
           40) font_change "PibotoCondensed\-BoldItalic" ;;
           41) font_change "PibotoCondensed\-Bold" ;;
           42) font_change "PibotoCondensed\-Italic" ;;
           43) font_change "PibotoCondensed\-Regular" ;;
           44) font_change "Piboto\-Italic" ;;
           45) font_change "Piboto\-LightItalic" ;;
           46) font_change "Piboto\-Light" ;;
           47) font_change "PibotoLtBoldItalic" ;;
           48) font_change "PibotoLtBold" ;;
           49) font_change "PibotoLtItalic" ;;
           50) font_change "PibotoLt\-Regular" ;;
           51) font_change "Piboto\-Regular" ;;
           52) font_change "Piboto\-ThinItalic" ;;
           53) font_change "Piboto\-Thin" ;;
           54) font_change "Pixel" ;;
           55) font_change "Quicksand\-Bold" ;;
           56) font_change "Quicksand\-Light" ;;
           57) font_change "Quicksand\-Medium" ;;
           58) font_change "Quicksand\-Regular" ;;
           59) font_change "TakaoGothic" ;;
           60) font_change "TakaoPGothic" ;;
            *) break ;;
        esac
    done
}

font_change() {
CUR_FONT=$(grep "overlay_text_font =" "${SCRIPT_LOC}"|awk '{print $3}')
export CUR_FONT
sed -i -E "s/overlay_text_font = ${CUR_FONT}/overlay_text_font = \"${1}\"/g" $SCRIPT_LOC
bgm_check
stats_check
}

stats_check() {
CURFONT=$(grep "overlay_text_font =" "$SCRIPT_LOC"|awk '{print $3}' | tr -d '"')
cfontr="\Z3$CURFONT\Zn"
exit
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

font_selection
