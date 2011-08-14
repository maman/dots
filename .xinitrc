#!/bin/bash

#dualmonitor-setup
if (xrandr | grep "VGA1 connected" > /dev/null); then
  xrandr --output LVDS1 --primary
  xrandr --output LVDS1 --mode 1280x800 --pos 0x0
  xrandr --output VGA1 --right-of LVDS1 --mode 1024x768 --pos 1280x0
  ck-launch-session /home/kitty/dots/sawfish.sh
else
  ck-launch-session /home/kitty/dots/subtle.sh
  #ck-launch-session /home/kitty/dots/sawfish.sh
  #ck-launch-session /home/kitty/dots/compiz.sh
fi

#Start WMFS
#exec wmfs

#Start SubtleWM
#exec ck-launch-session /home/kitty/dots/subtle.sh

#Start CompizWM
#exec ck-launch-session /home/kitty/dots/compiz.sh

#Start SawfishWM
#ck-launch-session /home/kitty/dots/sawfish.sh
