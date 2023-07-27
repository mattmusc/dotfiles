#!/bin/sh

BG_IMAGE=003.jpg

xsetroot -cursor_name arrow &
pgrep -x feh > /dev/null || feh --bg-scale $HOME/Pictures/Walls/$BG_IMAGE &

#picom --config .config/picom.conf -b

exec bspwm

