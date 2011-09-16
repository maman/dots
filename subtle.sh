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

#enable touchpad
xinput set-button-map 11 1 2 3 5 4

#remap Caps Lock to Escape
xmodmap ~/.Xmodmap &

#enable notification daemon
pidof twmnd >& /dev/null
if [ $? -ne 0 ]; then
#  /usr/lib/notification-daemon-1.0/notification-daemon &
  twmnd &
fi

#dualmonitor-setup
(
  sleep 5
  left &
  tail -f /home/kitty/.config/dzen/pager | dzen2 -ta l -bg '#151515' -x 0 -y 0 -h 17 -w 400 &
  bar
)&

#wallpaper
nitrogen --restore &

#exec SubtleWM
subtle
