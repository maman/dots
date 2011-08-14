#!/bin/bash

#Merging .Xdefaults
xrdb -merge ~/.Xdefaults &

#set X font path
xset +fp /home/kitty/.fonts &
xset +fp /usr/share/fonts/jmk &
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

#enable notification daemon
pidof notification-daemon >& /dev/null
if [ $? -ne 0 ]; then
  /usr/lib/notification-daemon-1.0/notification-daemon &
fi

#coooonkies
conky -c /home/kitty/git/conkyconf/conkyrc2 &
conky -c /home/kitty/git/conkyconf/conkyrc3 &

#wallpaper
nitrogen --restore &

#exec SubtleWM
subtle
