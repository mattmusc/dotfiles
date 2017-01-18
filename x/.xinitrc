#!/bin/bash
# -------------------------------------------------
# file:     ~/.xinitrc
# author:   Matteo Muscella 
# -------------------------------------------------

cd $HOME

exec >> ~/.xsession-errors 2>&1

. ~/.environment

xsetroot -cursor_name left_ptr

xset +fp /usr/share/fonts/X11/100dpi/
xset +fp /home/matteo/.fonts/
xset +fp /home/matteo/.fonts/bitmap/envypn-font/
xset +fp /home/matteo/.fonts/bitmap/haxor/
xset +fp /home/matteo/.fonts/bitmap/phallus/
xset +fp /home/matteo/.fonts/bitmap/proggy/
xset +fp /home/matteo/.fonts/bitmap/progsole/
xset +fp /home/matteo/.fonts/bitmap/siji/
xset +fp /home/matteo/.fonts/bitmap/stlarch/
xset fp rehash &

xrdb -merge ~/.Xresources &

xrandr --output DVI-I-1 --primary \
       --output DP-1 --left-of DVI-I-1 --rotate right &

wal -i /home/matteo/pic/11.jpg &

urxvtd -q -f &

sxhkd &

exec bspwm -c ~/.config/bspwm/bspwmrc

