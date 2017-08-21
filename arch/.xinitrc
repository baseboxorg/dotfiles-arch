#!/bin/sh

urxvtd -q -f -o & sxhkd & redshift & mpd &
exec bspwm
