# -------------------------------------------------
# file:     ~/.xinitrc
# author:   Matteo Muscella 
# -------------------------------------------------

#!/bin/sh

cd $HOME

source $HOME/.profile

xrdb -merge $HOME/.Xresources &

xset +fp $HOME/.fonts &
xset +fp $HOME/Library/Fonts/ &
xset fp rehash &

xsetroot -cursor_name left_ptr

sh ~/.fehbg &

xmodmap ~/.Xmodmap &

export LANG="en_US.UTF-8"

exec >>~/.xsession-errors 2>&1
urxvtd &

while true; do
   xsetroot -name "$( date +"%A %d // %I:%M %p" )    "
   sleep 1m    # Update time every minute
done &

: "${wm:="monsterwm"}"
: "${ff:="/tmp/monsterwm.fifo"}"


while :; do "$wm" || break; done | tee -a "$ff"

