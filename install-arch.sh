#!/bin/bash

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
    xclip
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
    shellcheck\
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
    cryptsetup\
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
    docker
    dropbox
    easytag
    libreoffice-fresh
    slack-desktop\
)

set -x

notify "Updating..."
sudo pacman-key --refresh-keys
sudo pacman -Syu

notify "Installing prerequisites..."
sudo pacman --noconfirm -S base-devel cmake git curl wget gnupg2 stow

# Automatically install pacaur: cower.
notify "Installing pacaur..."
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

set +x

notify "Updating submodules..."
cd "$HERE"
git submodule update --recursive --remote
mkdir -p "${HOME}/bin"

notify "Installing new software..."
pacaur --noedit --noconfirm -S "${CLI[@]}"
pacaur --noedit --noconfirm -S "${NETWORK[@]}"
pacaur --noedit --noconfirm -S "${DEV[@]}"
pacaur --noedit --noconfirm -S "${RICE[@]}"
pacaur --noedit --noconfirm -S "${OTHER[@]}"
pacaur --noedit --noconfirm -S "${FONTS[@]}"

for pkg in "${OPTIONAL[@]}"
do
    if ask "Install ${pkg}?"; then
        pacaur --noedit --noconfirm -S "$pkg"
    fi
done

notify "Done! Reloading zsh..."
exec zsh
