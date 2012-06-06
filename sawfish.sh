#!/bin/bash

#start gnome-polkit auth
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#Merging .Xdefaults
xrdb -merge ~/.Xdefaults &

#set X font path
xset +fp /home/derp/.fonts &
#xset +fp /home/derp/.fonts-2 &
xset fp rehash &

#network
#wicd-client &
nm-applet &
tidybattery &
volumeicon &
dropboxd &

#urxvt daemon
urxvtd &

#devmon daemon
#devmon &

#udisksvm daemon
if ! pgrep -lf "udisks-daemon: polling /dev/sr0"; then
    udisks --poll-for-media /dev/sr0
fi

udisksvm >/dev/null &

#starting dropbox
#pidof dropbox >& /dev/null
#if [ $? -ne 0 ]; then
#  dropbox start &
#fi

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

#enable custom Xorg keybinds
#xmodmap /home/derp/.Xmodmap

#enable notification daemon
#pidof notification-daemon >& /dev/null
#if [ $? -ne 0 ]; then
  #/usr/lib/notification-daemon-1.0/notification-daemon &
#  twmnd &
#fi

#dzens
#/home/derp/.config/dzen/time &
#/home/derp/.config/dzen/mpd &

#compositing engine
compton -o 0.6 -r 20 -l -30 -t -10 -cCGb &

#idle monitor
xautolock -time 30 -locker "sudo pm-suspend" &

#wallpaper - compiz wallpaper plugin have issues with dualmonitor
nitrogen --restore &

#exec bmpanel2
bmpanel2 --theme=darks &

#exec Sawfish
sawfish
