#!/bin/bash

set -e

HERE="$(dirname "$(readlink -f "$0")")"

# TODO how to auto-backup existing dotfiles? stow will behave
# unhappily if it tries to create a symlink but that filename
# already exists.

(
cd "$HERE"
for dotdir in "$@"; do
    echo "LINKING ${dotdir}"
    if [[ -d "$dotdir" ]]; then
        stow -v -t "$HOME" "$dotdir"
    else
        echo "directory ${dotdir} does not exist."
    fi
done
)

cp "${HOME}/.tmux/.tmux.conf.local" "$HOME"

exec zsh
