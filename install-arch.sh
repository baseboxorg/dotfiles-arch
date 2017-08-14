#!/bin/bash

set -e

HERE="$(dirname "$(readlink -f "$0")")"
TMP="$(mktemp -d)"

cleanup () {
    rm -rf "$TMP"
}

trap cleanup EXIT

CYANBOLD='\033[1;36m'
YELLOWBOLD='\033[1;33m'
NOCOLOR='\033[0m'

notify() {
    echo -e "\n${CYANBOLD}[!] ${1}${NOCOLOR}\n"
}

function ask {
    while true; do
        echo -en "\n${YELLOWBOLD}[?] "$1" [y/n]: ${NOCOLOR}"
        read response
        case $response in
            [Yy]*) return 0 ;;
            [Nn]*) return 1 ;;
        esac
    done
}

CLI=(\
    asciinema
    htop
    httpie
    imgp
    ncdu
    progress
    trash-cli
    youtube-dl\
)

NETWORK=(\
    dnsutils
    iptables
    nmap
    ufw\
)

DEV=(\
    flake8
    neovim
    nvm
    pyenv
    python-pip
    python-requests
    python-virtualenv
    python3
    shellcheck
    the_silver_searcher
    tmux
    vim\
)

RICE=(\
    bspwm
    cava
    compton
    dunst
    highlight
    i3lock
    irssi
    libmpdclient
    maim
    mpc
    mpd
    mpv
    ncmpcpp
    neofetch
    polybar-git
    python-pywal
    redshift-minimal
    rofi
    rxvt-unicode
    scrot
    sxhkd
    sxiv
    w3m\
)

OTHER=(\
    cryptsetup
    light-git
    xclip\
)

FONTS=(\
    adobe-source-code-pro-fonts
    adobe-source-han-sans-otc-fonts
    adobe-source-sans-pro-fonts
    adobe-source-serif-pro-fonts
    ttf-arphic-uming
    ttf-dejavu
    ttf-font-awesome
    ttf-hack
    ttf-inconsolata
    ttf-liberation
    ttf-monaco
    ttf-ms-fonts
    ttf-noto
    ttf-roboto
    ttf-symbola
    ttf-twemoji-color
    ttf-unifont\
)

OPTIONAL=(\
    adwaita-qt4
    deluge
    docker
    dropbox
    easytag
    gnome-themes-standard
    keepassx2
    libreoffice-fresh
    slack-desktop\
)

if ask "Refresh pacman keys?"; then
    sudo pacman-key --refresh-keys
fi

notify "Updating install..."
sudo pacman -Syu

notify "Installing prerequisites..."
sudo pacman --noconfirm -S base-devel cmake git curl wget gnupg2 stow openssh

if ask "Install pacaur (required for software installation)?"; then
    # Automatically install pacaur: cower.
    cd "$TMP"
    mkdir cower && cd cower
    gpg2 --recv-keys 1EB2638FF56C0C53
    curl "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower" -o PKGBUILD
    . "/etc/profile.d/perlbin.sh"
    makepkg -si

    # Automatically install pacaur: pacaur.
    cd "$TMP"
    mkdir pacaur && cd pacaur
    curl https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur -o PKGBUILD
    makepkg -si
fi

notify "Updating submodules..."
cd "$HERE"
git submodule update --recursive --remote
mkdir -p "${HOME}/bin"

notify "Installing new software..."
if ask "Install CLI software?"; then
    pacaur --noedit --noconfirm -S "${CLI[@]}"
fi
if ask "Install NETWORK software?"; then
    pacaur --noedit --noconfirm -S "${NETWORK[@]}"
fi
if ask "Install DEV software?"; then
    pacaur --noedit --noconfirm -S "${DEV[@]}"
fi
if ask "Install RICE software?"; then
    pacaur --noedit --noconfirm -S "${RICE[@]}"
fi
if ask "Install OTHER software?"; then
    pacaur --noedit --noconfirm -S "${OTHER[@]}"
fi
if ask "Install FONTS?"; then
    pacaur --noedit --noconfirm -S "${FONTS[@]}"
fi

for pkg in "${OPTIONAL[@]}"
do
    if ask "Install ${pkg}?"; then
        pacaur --noedit --noconfirm -S "$pkg"
    fi
done

notify "Done! Reloading zsh..."
exec zsh
