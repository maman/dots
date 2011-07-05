#!/bin/bash

#Merging .Xdefaults
xrdb -merge ~/.Xdefaults

#set X fontpath
xset +fp /home/fake/.fonts &
xset fp rehash &

#activate two-fingers click
synclient TapButton3=3 TapButton2=2

#util
#TXID='tabbed -d 2>/dev/null'
#surf -e $TXID google.com &

#Exec DWM
#exec /home/fake/.dotfiles/dwm.sh

#Exec Subte
exec /home/fake/.dotfiles/subtle.sh

#Exec PekWM
#exec pekwm

#Exec Compiz-WM
#exec /home/fake/.dotfiles/compiz.sh

#Exec WMFS
#exec wmfs

#Exec Sawfish
#exec /home/fake/.dotfiles/sawfish.sh

#Exec OpenBox
#exec openbox-session
