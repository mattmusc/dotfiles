#!/bin/bash
# -------------------------------------------------
# file:     ~/.xinitrc
# author:   Matteo Muscella 
# -------------------------------------------------

cd $HOME

exec >> ~/.xsession-errors 2>&1

. $HOME/.environment

xrandr --output DVI-I-1 --primary \
       --output DP-1 --left-of DVI-I-1 --rotate right &

xrdb -merge ~/.Xresources &

xset +fp /home/musci/.fonts/
xset +fp /home/musci/.fonts/bitmap/ctrld-font/
xset +fp /home/musci/.fonts/bitmap/envypn-font/
xset +fp /home/musci/.fonts/bitmap/haxor/
xset +fp /home/musci/.fonts/bitmap/phallus/
xset +fp /home/musci/.fonts/bitmap/proggy/
xset +fp /home/musci/.fonts/bitmap/siji/

xset fp rehash &

xsetroot -cursor_name left_ptr &

wal -i "$(< "${HOME}/.cache/wal/wal")" &
dropbox &
urxvtd -q -o -f &

#while true
#do
#    xsetroot -name " $( date +'%a, %d %b // %H:%M' )"
#    sleep 1m # Update every minute
#done &
#
#exec dwm >> ~/.dwm-errors 2>&1

2bwm >> ~/.2bwm-errors 2>&1 &
exec xwait
