#!/bin/bash

HERE="$(dirname "$(readlink -f "$0")")"

# NOTE: This software install script assumes...
# base-devel, pacaur, git, zsh already installed,
# and that zsh is the login shell of the user.

PACAUR_BASICS=(\
    cryptsetup
    curl
    ffmpeg
    gnupg2
    htop
    httpie
    ncdu
    ngrok
    nvm
    python3
    shellcheck
    stow
    the_silver_searcher
    tmux
    vim
    wget
    xclip
    youtube-dl\
)

PACAUR_PYTHON=(\
    flake8
    pyenv
    python-pip
    python-requests
    python-virtualenv\
)

PACAUR_RICE=(\
    bspwm
    cmus
    compton
    dunst
    i3lock
    maim
    mpv
    neofetch
    polybar
    redshift-minimal
    rofi
    rxvt-unicode
    sxhkd
    sxiv
    wal-git\
)

PACAUR_OTHER=(\
    keepassx2\
)

PACAUR_FONTS=(\
    adobe-source-code-pro-fonts
    adobe-source-han-sans-otc-fonts
    adobe-source-sans-pro-fonts
    adobe-source-serif-pro-fonts
    bdf-unifont
    ttf-arphic-uming
    ttf-dejavu
    ttf-font-awesome
    ttf-freefont
    ttf-google-fonts-git
    ttf-hack
    ttf-inconsolata
    ttf-liberation
    ttf-monaco
    ttf-ms-fonts
    ttf-noto
    ttf-opensans
    ttf-roboto
    ttf-roboto-mono
    ttf-symbola
    ttf-twemoji-color\
)

# TODO
# pywal
# neovim
# ranger
# cava
# zathura
# irssi
# rtorrent-git

CYANBOLD='\033[1;36m'
NOCOLOR='\033[0m'

notify() {
    echo -e "\n${CYANBOLD}[!] ${1}${NOCOLOR}\n"
}

cd "$HERE"
git submodule update --recursive --remote
mkdir -p "${HOME}/bin"

notify "Refreshing current install..."
sudo pacman-key --refresh-keys
pacaur --noedit --noconfirm -Syu

notify "Installing new software..."
pacaur --noedit --noconfirm -S "${PACAUR_BASICS[@]}"
pacaur --noedit --noconfirm -S "${PACAUR_PYTHON[@]}"
pacaur --noedit --noconfirm -S "${PACAUR_RICE[@]}"
pacaur --noedit --noconfirm -S "${PACAUR_OTHER[@]}"
pacaur --noedit --noconfirm -S "${PACAUR_FONTS[@]}"

notify "Reloading zsh..."
exec zsh
