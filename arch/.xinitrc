#!/bin/sh

urxvtd -q -f -o &
sxhkd &
redshift &
mpd &
dunst &
polybar top &
polybar bottom &

wal-set --useprev                       && \
    [[ -f ~/.Xresources ]]              && \
    xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr

# TODO execute wal-set after bspwm somehow in order to get bspwm window module working in polybar
exec bspwm
