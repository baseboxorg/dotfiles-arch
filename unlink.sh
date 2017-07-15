#!/bin/bash

set -e

for d in $(ls -d */)
do
    stow -v -D -t "$HOME" "$d"
done
