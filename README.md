## counter-strike
Counter strike config/settings repository.

**Source:** [SteamCommunity](https://steamcommunity.com/sharedfiles/filedetails/?id=1359394619)

**This config/settings was tested in Arch/Manjaro Linux.**

### GPU Drivers 
#### Nvidia install privative drivers.
**Source:** [Wiki](https://wiki.manjaro.org/index.php?title=Configure_Graphics_Cards)

**Privative:**
>sudo mhwd -a pci nonfree 0300

**Return to free drivers:** 
>sudo mhwd -a pci free 0300'

### GPU Settings 
**Set OpenGL and PowerMizer settings in performance mode.**
![image](https://i.imgur.com/iuCX9PN.png)

![image](https://i.imgur.com/ahfDvrI.png)

### CPU Governor 
#### Install gamemode and configure in game launch options.
Let's use Feral gamemode for this.  
**Source:** [Github](https://github.com/FeralInteractive/gamemode/blob/master/README.md)

#### Install gamemode
> yes | sudo pacman -S gamemode

#### Set performance mode manually.
>The default cpu governor is set to powersave mode.  
To change that enter the following command into Teminal:  
**echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor**
>
You can also create a script to run this command by following these steps:  
> Change dir to the dir you want to save it in (In Terminal)  
**cd /....**  
(for example cd Documents. Default is HOME)  
> Create the file
nano performanceMode.sh
> Paste this script

>#!/bin/bash
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
> Save
Ctrl + X
Y
Enter
> Set as executable
chmod +x performanceMode.sh

If the last step doesnt work try running it with sudo.

To check it is set, etner:
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
into Terminal. 

### Mouse Acceleration 
**Disable mouse acceleration.**  
**Source:** [Wiki](https://wiki.archlinux.org/index.php/Mouse_acceleration#with_libinput)

- Create file: /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
- Add follow content:

>Section "InputClass"
	Identifier "My Mouse"
	MatchIsPointer "yes"
	Option "AccelerationProfile" "-1"
	Option "AccelerationScheme" "none"
	Option "AccelSpeed" "-1"
EndSection

* You should restart X.

### Digital Vibrance/Saturation 
You can use the script digitalVibrance.sh located un global-offensive folder. Just specify the value that you want.

> ./digitalVibrance 800

### Save to Startup 
>Some settings such as nvidia refresh rate/PowerMizer settings might revert to default after reboot.
To prevent that, we'll add them into our Startup Applications.
>
> Open Startup Applications (might be inside gnome-tweak-tool or standalone)
PowerMizer
> Add new entry with the following command:
nvidia-settings -a [gpu:0]/GpuPowerMizerMode=1
Refresh rate and Resolution
> Add new entry with the following command:
xrandr --output DP-1 --mode 1920x1080 --rate 120.00

#### My full game launch settings.
-noforcemparms -noforcemaccel -noforcemspd -novid -high -tickrate 128 