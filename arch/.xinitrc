#!/bin/sh

sxhkd &
redshift &
compton --config ~/.config/compton/compton.conf -b &
urxvtd -q -f -o

# dunst + polybar are kicked off in wal-set.
wal-set --useprev && [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xsetroot -cursor_name left_ptr

exec bspwm
