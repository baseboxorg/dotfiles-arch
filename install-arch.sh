#!/bin/bash

HERE="$(dirname "$(readlink -f "$0")")"
TMP="$(mktemp -d)"

cleanup () {
    rm -rf "$TMP"
}

trap cleanup EXIT

CYANBOLD='\033[1;36m'
NOCOLOR='\033[0m'

notify() {
    echo -e "\n${CYANBOLD}[!] ${1}${NOCOLOR}\n"
}

PACAUR_BASICS=(\
    cryptsetup
    curl
    dropbox
    ffmpeg
    htop
    iptables
    ncdu
    nvm
    pass
    python3
    shellcheck
    stow
    the_silver_searcher
    tmux
    trash-cli
    ufw
    vim
    xclip\
)

PACAUR_UTIL=(\
    httpie
    imgp
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
    compton
    dunst
    i3lock
    libmpdclient
    maim
    mpd
    mpv
    ncmpcpp
    neofetch
    polybar-git
    redshift-minimal
    rofi
    rxvt-unicode
    scrot
    sxhkd
    sxiv
    wal-git\
)

PACAUR_OTHER=(\
    libreoffice-fresh
    texlive-core
    texlive-latexextra
    texlive-fontsextra\
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

# Automatically install pacaur.
set -x
sudo pacman --noconfirm -Sy base-devel cmake git wget gnupg2

cd "$TMP"
mkdir cower && cd cower
gpg2 --recv-keys 1EB2638FF56C0C53
curl "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower" -o PKGBUILD
. "/etc/profile.d/perlbin.sh"
makepkg -si

cd "$TMP"
mkdir pacaur && cd pacaur
curl https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur -o PKGBUILD
makepkg -si

cd "$HERE"
git submodule update --recursive --remote
mkdir -p "${HOME}/bin"

notify "Refreshing current install..."
sudo pacman-key --refresh-keys
pacaur --noedit --noconfirm -Syu
set +x

notify "Installing new software..."
pacaur --noedit --noconfirm -S "${PACAUR_BASICS[@]}"
pacaur --noedit --noconfirm -S "${PACAUR_UTIL[@]}"
pacaur --noedit --noconfirm -S "${PACAUR_PYTHON[@]}"
pacaur --noedit --noconfirm -S "${PACAUR_RICE[@]}"
pacaur --noedit --noconfirm -S "${PACAUR_OTHER[@]}"
pacaur --noedit --noconfirm -S "${PACAUR_FONTS[@]}"

notify "Reloading zsh..."
exec zsh
