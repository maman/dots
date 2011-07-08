#!/bin/bash

#Merging .Xdefaults
xrdb -merge ~/.Xdefaults

#set X font path
xset +fp /home/fake/.fonts &
xset fp rehash &

#network
wicd-client &

#urxvt daemon
urxvtd &

#thunar daemon
thunar --daemon &

#starting last.fm daemon
mpdscribble &

#enable two-finger scrolling
sh /home/kitty/dots/touchpad.sh &

#enable compositing
xcompmgr -c -r 35 -t -15 -l -55 -o .60 &

#dualhead setup
if (xrandr | grep "VGA1 connected" > /dev/null); then
	/bin/sh /home/kitty/.screenlayout/2304x800-weblayout.sh &
	(
		sleep 5
		#/bin/zsh /home/fake/.config/subtle/dzen_bar &
		#tail -f /home/fake/.config/subtle/pager | dzen2 -bg '#202020' -x 0 -y 0 -w 500 -h  17 -fn 'Pragmata-7' -ta 'l' &
		#conky -c /home/fake/.conkyrc1 | dzen2 -bg '#202020' -x 500 -w 1304 -h 17 -fn 'Pragmata-7' &
		#conky | dzen2 -bg '#202020' -fg '#646464' -x 1804 -y 0 -w 500 -h  17 -fn 'Pragmata-7' -ta 'r' &
	) &
else
	(
	  	sleep 5
	  	#/bin/zsh /home/fake/.config/subtle/dzen_bar &
	  	#tail -f /home/fake/.config/subtle/pager | dzen2 -bg '#202020' -x 0 -y 0 -w 500 -h  17 -fn "-*-lime-*-*-*-*-10-*-*-*-*-*-*-*" -ta 'l' &
	  	#conky | dzen2 -bg '#202020' -fg '#646464' -x 500 -y 0 -w 780 -h  17 -fn "-*-lime-*-*-*-*-10-*-*-*-*-*-*-*" -ta 'r' &
	  	#tail -f /home/fake/.config/subtle/pager | dzen2 -bg '#202020' -x 0 -y 0 -w 500 -h  17 -fn 'Pragmata-7' -ta 'l' &
	  	#conky -c /home/fake/.conkyrc1 | dzen2 -bg '#202020' -x 500 -w 280 -h 17 -fn 'Pragmata-7' &
	  	#conky | dzen2 -bg '#202020' -fg '#646464' -x 780 -y 0 -w 500 -h  17 -fn 'Pragmata-7' -ta 'r' &
	) &
fi

#wallpaper
nitrogen --restore &

#exec Compiz
sawfish