#!/bin/sh

urxvtd -q -f -o & sxhkd & redshift & mpd &

"${HOME}/bin/archscripts/wal-set" --useprev && \
exec bspwm
