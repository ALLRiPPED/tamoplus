## TAMO+: Themes And Music Overlay Plus v1.25 (formally known as TAMPO)
## Install Preparations!
I ran into an issue with this being installed to a fresh vanilla img of RetroPie v4.7.1, it has not generated the nessasary config files<br>
that this install script is looking for, so make sure you have atleast played one game and installed and set atleast one theme on your retropie.<br>
And no before you ask, the default theme, Carbon, does not count you have to install atleast a second theme then set it.<br>
And then the es_settings.cfg will automatically be generated<br>
plus it would not hurt to run `sudo apt update -y && sudo apt upgrade -y`
## One Line Install
     curl -sSL https://t.ly/5Oqi | bash
or

	 wget -O - https://t.ly/5Oqi | bash
If you would like to manually install this script:

     git clone https://github.com/ALLRiPPED/tamoplus.git
     cd tamoplus
     sudo chmod +x local_installer.sh
     ./local_installer.sh
This will install all the files for the bgm script, themes, music, videoloading and splash screens!<br>
## More Information
This is a script that is similar to Kio Diekin's theme and music script, but mine was made only by me and this is in no way the works he premeries in this video:<br>
https://www.youtube.com/watch?v=I0nUTGeLT8o<br>

This installs all the associated themes, background music, videoloadingscreens, and of course the splashscreens and exitscreens<br>
for Halloween and Christmas Holiday themes and Stranger Things Theme plus my own concoction theme set Carbonite, for now, hopefully more to come!<br>
This also installs the BGM Control Script from here [retropie_music_overlay](https://github.com/ALLRiPPED/retropie_music_overlay) as this is the complete<br>
merging of the BGM as well as the original idea for TAMPO and TAMO+.<br>
It will do the full shabang, that means when you run tamo+ from your retropie menu and choose a theme it will restart emulationstation, not the pi itself,<br>
so if you want to see the splashscreen you will have to manually reboot the pi, but you can turn off the exit splashes and the videoloading screens.<br><br>
This is open source and free for anyone to use, just drop me a little credit is all I ask.<br>
The script has a one line install, so no need to clone a repo (it does all that for you).<br>
Now if you have any sugesstions or addition please fork the repo and hit me up with a pull request.<br>
## Preview
[![](https://i.imgur.com/4Z3IDi8.png)](https://youtu.be/8lft4ufwE0o "Demo Preview")
## Future Plans
#### Not Done. <img src="https://i.imgur.com/Jp2FKHX.png" alt="Not Done" style="float: left; margin-right: 10px;" /> Add more Holiday based themes.
#### Not Done. <img src="https://i.imgur.com/Jp2FKHX.png" alt="Not Done" style="float: left; margin-right: 10px;" /> Adding other themes of the like with the full shabang; splash, videoloading, music, etc.
#### Not Done. <img src="https://i.imgur.com/Jp2FKHX.png" alt="Not Done" style="float: left; margin-right: 10px;" /> Adding the ability to the control script to change overlay and text colors.

## Color Section
This is where you will find the info you will need to change the colors of the background and font on the Overlay.<br>
At the moment I have a color table here with color names that can be typed in to the RPBGMO bash gui, right now they have to be typed in cause getting bash script color is not as easy to code as you would think.
### [Table of Color Names](https://allripped.github.io/ImageMagickColors.html)

## CONFIG SECTION
Edit these manually to adjust the script to your needs:
<br>
startdelay = 0 # Value (in seconds) to delay audio start.  If you have a splash screen with audio and the script is playing music over the top of it, increase this value to delay the script from starting.

maxvolume = 0.50<br>
volumefadespeed = 0.02<br>
restart = True # If true, this will cause the script to fade the music out and -stop- the song rather than pause it.<br>
startsong = "" # if this is not blank, this is the EXACT, CaSeSeNsAtIvE filename of the song you always want to play first on boot.<br>
<br>
###Overlay Config###

overlay_enable = True # Enable or disable the overlay<br>
overlay_fade_out = True # Change to "False" to have the overlay remain on the screen until an emulator/application is launched<br>
overlay_fade_out_time = 5 # Hide the overlay after X seconds<br>
overlay_pngview_location = '/usr/local/bin/pngview'<br>
overlay_background_color = 'black'<br>
overlay_text_color = 'white'<br>
overlay_text_font = 'FreeSans'<br>
overlay_tmp_file = '/dev/shm/song_title.png<br>
overlay_rounded_corners = False #Set to "True" round the corners of the overlay<br>
overlay_size = '600x64'<br>
overlay_x_offset = '0'<br>
overlay_y_offset = '0'<br>
## Credits, cause they are that important
Props to Livewire for the original script: https://retropie.org.uk/forum/topic/347/background-music-continued-from-help-support<br>
Special thanks to AndrewFromMelbourne for pngview: https://github.com/AndrewFromMelbourne/raspidmx<br>
RetroPie forum thread: https://retropie.org.uk/forum/topic/16458/modified-background-music-script-with-added-overlays<br>
BGM Overlay code added by madmodder123<br>
BGM.py Version 1.01 - Changed song_title.png to write to RAM instead of the SD Card (Thanks zerojay!)<br>
BGM.py Version 1.60 - Added one line install and control scripts by thepitster<br>
TAMO+ Version 1.20 - Total script rewrite thanks to a big help from the [Supreme Team](https://github.com/SupremePi "Supreme Team")
### TAMO+ Credits
The Halloween theme, music, splash, and videoloading screens are from the build [32GB]-Halloween.Candy.RPI4.2gb.4gb-Scoony and DB Project<br>
The Christmas theme, music, splash, and videoloading screens are from the build [32gb]-Christmas.Pi.RPI4-Scoony.Hursty, though I did shorten the splashscreen down from 2 minutes 38 seconds to 1 minute 40 seconds<br>
Diablos Arcade by the [Retro-Devils](https://github.com/Retro-Devils/Devils-Pi "Diablos Arcade")<br>
Pistolero by [Kio Dieken](https://www.youtube.com/c/kiodiekin "Kio Dieken")<br>
[Dwayne Hurst](https://github.com/retrohursty69 "Dwayne Hurst") for every thing he has done with themes, which some are included in tamo+.<br>
Version 1.00 - thepitster<br>
Version 1.05 - Added Devil Chromey from the Diablos Arcade Build by The [Retro-Devils](https://github.com/Retro-Devils "Retro-Devils")<br>
Version 1.10 - Added Pistolero From Return Of Pistolero Build by [Kio Dieken](https://www.youtube.com/c/kiodiekin "Kio Dieken")<br>Fixed quite a few script errors and tweaked the install scripts.<br>
Version 1.20 - Added Pleasure Paradise From Peasure Paradise Build by MBM<br>Fixed script errors and tweaked the install scripts.<br>
Version 1.25 - Also added Supreme Team Supreme_Space themeset.<br>
