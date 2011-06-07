#!/bin/bash

xrdb -merge .Xresources

xsetroot -cursor_name left_ptr -solid black

setxkbmap -option ctrl:swapcaps

xscreensaver &

~/.dropbox-dist/dropboxd &

exec xmonad
