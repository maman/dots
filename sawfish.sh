#!/bin/bash

#Merging .Xdefaults
xrdb -merge ~/.Xdefaults &

#set X font path
xset +fp /home/kitty/.fonts &
xset fp rehash &

#network
wicd-client &

#urxvt daemon
urxvtd &

#thunar daemon
thunar --daemon &

#starting mpd & last.fm daemon
pidof mpd >& /dev/null
if [ $? -ne 0 ]; then
  mpd &
fi
pidof mpdscribble >& /dev/null
if [ $? -ne 0 ]; then
  mpdscribble &
fi

#enable two-finger scrolling
sh /home/kitty/dots/touchpad.sh &

#enable compositing
#xcompmgr -c -r 35 -t -15 -l -55 -o .60 &

#wallpaper
nitrogen --restore &

#notification daemon
/usr/lib/notification-daemon-1.0/notification-daemon &

#taskbar and system notifications yay
#tint2 &
#conky -c ~/git/conkyconf/conkyrc --display=:0 &

#exec Compiz
sawfish
