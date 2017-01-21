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

xautolock -time 5 -locker lock &

test -e "$HOME/usr/bin/panel" && panel >> $HOME/.panel-errors 2>&1 &

2bwm >> $HOME/.2bwm-errors 2>&1 &
exec xwait
