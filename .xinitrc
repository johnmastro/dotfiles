#!/bin/bash

xrdb -merge .Xresources

xsetroot -cursor_name left_ptr -solid black

setxkbmap -option ctrl:swapcaps

xscreensaver -nosplash &

~/.dropbox-dist/dropboxd &

exec xmonad
