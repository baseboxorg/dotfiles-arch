#!/bin/sh

# wal-set kicks off dunst and polybar because they need to be
# re-themed with the new X colors set by wal.
wal-set --useprev                       && \
    [[ -f ~/.Xresources ]]              && \
    xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr
sxhkd &
redshift &
compton --config ~/.config/compton/compton.conf &
mpd &
urxvtd -q -f -o &

exec bspwm
