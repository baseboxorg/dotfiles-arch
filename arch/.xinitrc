#!/bin/sh

urxvtd -q -f -o &
sxhkd &
redshift &
compton --config ~/.config/compton/compton.conf &
mpd &
dunst &
polybar top &
polybar bottom &

wal-set --useprev                       && \
    [[ -f ~/.Xresources ]]              && \
    xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr

exec bspwm
