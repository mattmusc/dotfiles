#!/bin/bash
# -------------------------------------------------
# file:     ~/.xinitrc
# author:   Matteo Muscella
# -------------------------------------------------

cd $HOME

[[ -f ~/.environment ]] && source  $HOME/.environment

# Load a resource file, and merge with the current settings.
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec >> ~/.xsession-errors 2>&1

# Ensure that the scripts in /etc/X11/xinit/xinitrc.d are sourced
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set my displays
xrandr --output DP-1 --rotate right --left-of DVI-I-1

# Update fonts
xset fp+ /home/matt/.fonts/bitmap/ctrld-font/
xset fp+ /home/matt/.fonts/bitmap/haxor/
xset fp+ /home/matt/.fonts/bitmap/tamzen-font/
xset fp+ /home/matt/.fonts/bitmap/gohufont/
xset fp+ /home/matt/.fonts/bitmap/siji/

xset fp rehash &
fc-cache -f &

# Restore the Nitrogen set wallpapers
nitrogen --restore

# Add this to your .xinitrc or whatever file starts programs on startup.
wal -i "$(< "${HOME}/.cache/wal/wal")"

#dropbox &
#xautolock -time 5 -locker lock &

exec awesome

