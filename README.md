## TAMO+: Themes And Music Overlay Plus v1.41 (formally known as TAMPO)
This can install all the associated themes, background music, videoloadingscreens, and of course the splashscreens and exitscreens<br>
for two Holiday themes and my own concoction theme set Carbonite, for now, hopefully more to come!<br>
Also it removes everything from the RetroPie Menu that will be included in TAMO+ (IE: esthemes, audiosettings, & splashscreen.rp for vanilla retropie users)<br>
And for those using Supreme Ultra builds it removes Audio Settings, Controller Settings, & Visual Settings from the RetroPie Menu.<br>
All of which can be found from within the TAMO+ script itself.<br>
This installs the same BGM Control Script from here [retropie_music_overlay](https://github.com/ALLRiPPED/retropie_music_overlay) as this is the complete merging of the BGM as well as the original idea for TAMPO and TAMO+.<br>
It will do the full shabang, that means when you run tamo+ from your retropie menu and choose one of the preconfigured themes it will restart emulationstation, not the pi itself, so if you want to see the splashscreen you will have to manually reboot the pi, and you can turn the exit splashes and the videoloading screens on or off.<br><br>
Now when installing you are able to keep your RetroPie Menu items, or if you choose to remove your Menu items you now restore it back to the orignal. Compatible with Supreme Ultra Builds.<br>
The install and main scripts now let you install the themesets and music seprately later after installation of TAMO+.<br>
This is open source and free for anyone to use, just drop me a little credit is all I ask.<br>
The script has a one line install, so no need to clone a repo (it does all that for you).<br>
Now if you have any sugesstions or addition please fork the repo and hit me up with a pull request.<br>
## Install Preparations!
This will prep everything needed for TAMO+ to run on your system, hence everything needed will automatically be generated<br>
plus it would not hurt to run `sudo apt update -y && sudo apt upgrade -y` just to make sure you are up-to-date<br>
## One Liner Install
```bash
curl -sSL https://bit.ly/Install-TAMO | bash
```
or
```bash
wget -O - https://bit.ly/Install-TAMO | bash
```
## One Liner Install Mirrors
```bash
wget -O - https://t.ly/5Oqi | bash

```
or
```bash
curl -sSL https://t.ly/5Oqi | bash
```
If you would like to manually install this script:
```bash
git clone https://github.com/ALLRiPPED/tamoplus.git
cd tamoplus
sudo chmod +x local_installer.sh
./local_installer.sh
```
This will install all the files for the bgm script, themes, music, videoloading and splash screens!<br>
## More Information
This is a script that is similar to Kio Diekin's theme and music script, but mine was made only by me and this is in no way the works he premeries in this video:<br>
https://www.youtube.com/watch?v=I0nUTGeLT8o<br>

#### What Comes With TAMO+
1. TAMO+ Configuration Script.
2. BGM.py by madmodder123.
3. Sinden Lightgun.
4. Supreme's PieMarquee2.
5. Assortment of Audio Tool Scripts.
6. Assortment of Controller Tool Scripts.
7. Assortment of Visual Tool Scripts.
8. Rearranges Retropie Menu items with above tools or leaves the default menu intact (can be switched in script).
9. Scripts for Themes and Bezels, plus much more.
#### Total Available Themesets
1. Carbonite (thepitster).
2. Christmas (Dwayne Hurst).
3. Diablos Arcade (Retro-Devils).
4. Halloween (spoony and Dwayne Hurst).
5. Neon IBAD (Retro-Devils).
6. Pistolero (Kio Dieken).
7. Pleasure Paradise (MBM).
8. Stranger Things (Filipe Bello).
9. Supreme Team (Supreme Team).
#### Total Available Background Music
1. Arcade (Unknown).
2. Custom (Brutal Legend Soundtrack).
3. Nostalgia Trip (Brian Damaso).
4. Ultimate Vs. Fighter (David Ball).
5. Venom (Kio Dieken).
## Preview
[![](https://i.imgur.com/jPYSdPr.png)](https://youtu.be/8lft4ufwE0o "Demo Preview")
## Color Section
This is where you will find the info you can refference to change the colors of the background and font on the Overlay in the script.<br>
I have a [Table of Color Names](https://allripped.github.io/ImageMagickColors.html) with the names that can be typed in to the BGM python script if you prefer to customize the overlay more.<br>
find the lines in the BGM.py script and edit them to fit your needs.
```python
overlay_background_color = "DimGray"
overlay_text_color = "LightCoral"
```
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
Diablos Arcade and Neon INAD by the [Retro-Devils](https://github.com/Retro-Devils/Devils-Pi "Retro-Devils")<br>
Pistolero by [Kio Dieken](https://www.youtube.com/c/kiodiekin "Kio Dieken")<br>
[Dwayne Hurst](https://github.com/retrohursty69 "Dwayne Hurst") for every thing he has done with themes, which some are included in tamo+.<br>
Version 1.00 - thepitster<br>
Version 1.05 - Added Devil Chromey from the Diablos Arcade Build by The [Retro-Devils](https://github.com/Retro-Devils "Retro-Devils").<br>
Version 1.10 - Added Pistolero From Return Of Pistolero Build by [Kio Dieken](https://www.youtube.com/c/kiodiekin "Kio Dieken"). Fixed quite a few script errors and tweaked the install scripts.<br>
Version 1.20 - Added Pleasure Paradise From Peasure Paradise Build by MBM<br>Fixed script errors and tweaked the install scripts.<br>
Version 1.25 - Also added Supreme Team Supreme_Space themeset.<br>
Version 1.30 - Added font, font color, and overlay color selections to the menu for the overlay. Only 60 fonts and 134 font colors have been coded into script so far to choose from.<br>
Version 1.31 - Added Controller Settings to Main Menu. also added Sinden Lightgun Drivers Install<br>
Version 1.35 - You now can keep your retropie menu intact or restore it later. Plus rearranged the install so user settings do not get over writen in BGM.py when you update.<br>
Version 1.40 - Redone install and main scripts, so the themesets and music you can now choose to install them separately later after install.<br>
Version 1.41 - Added Neon IBAD from The [Retro-Devils](https://github.com/Retro-Devils "Retro-Devils").<br>
