#!/bin/bash

xsetroot -cursor_name left_ptr
xrdb -merge $HOME/.Xresources
xmodmap -e "keycode 74 = dead_greek"
xmodmap -e "keycode 76 = Multi_key"
# Turn off the damn AccessX
xkbset -a

# Check for and start emacs daemon
#ps ax | grep emacs | grep daemon
#if [ -n $? ]; then
#  emacs -nw --daemon
#fi

/etc/thinkpad/dock.sh
sleep 5 && feh --bg-max --no-xinerama $HOME/.bg
$HOME/bin/vpn-up &
