#!/bin/bash

#start gnome-polkit auth
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#Merging .Xdefaults
xrdb -merge ~/.Xdefaults &

#set X font path
xset +fp /home/derp/.fonts &
xset +fp /usr/share/fonts/X11/jmk &
#xset +fp /home/derp/.fonts-2 &
xset fp rehash &

#network
#wicd-client &
#stalonetray &
nm-applet &
tidybattery &
volumeicon &
dropboxd &

#urxvt daemon
urxvtd &

#thunar daemon
thunar --daemon &

#automount daemon
udiskie &

#starting mpd & last.fm daemon
pidof mpd >& /dev/null
if [ $? -ne 0 ]; then
  mpd &
fi
pidof mpdscribble >& /dev/null
if [ $? -ne 0 ]; then
  mpdscribble &
fi

#enable two-finger reverse scrolling
xinput set-button-map 12 1 2 3 5 4

#compositing engine
compton -o 0.6 -r 20 -l -30 -t -10 -cCGb &

#idle monitor
#xautolock -time 30 -locker "sudo pm-suspend" &

#wallpaper - compiz wallpaper plugin have issues with dualmonitor
nitrogen --restore &

#dzens
#/home/derp/.config/dzen/time &
#/home/derp/.config/dzen/mpd &

#exec bmpanel2
bmpanel2 --theme=darks &
conky -c ~/.config/conky/conkyrc-utils &

#exec Sawfish
sawfish
