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
nm-applet &
dropboxd &

#urxvt daemon
urxvtd &

#thunar daemon
thunar --daemon &

#automount daemon
udiskie &

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
  #twmnd &
#fi

#dzens
/home/derp/.config/dzen/time &
/home/derp/.config/dzen/mpd &

#coooonkies
#conky -c /home/kitty/git/conkyconf/conkyrc2 &
#conky -c /home/kitty/git/conkyconf/conkyrc3 &

#wallpaper - compiz wallpaper plugin have issues with dualmonitor
nitrogen --restore &

#exec stalonetray
stalonetray &

#exec AWN
avant-window-navigator &

#exec Compiz
compiz ccp
