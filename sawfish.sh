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

#enable touchpad enhancements
xinput set-button-map 11 1 2 3 5 4

#wallpaper
nitrogen --restore &

#notification daemon
/usr/lib/notification-daemon-1.0/notification-daemon &

#taskbar and system notifications yay
bmpanel2 &
conky -c ~/git/conkyconf/conkyrc4 &
conky -c ~/git/conkyconf/conkyrc5 &

#exec Compiz
sawfish
