#!/bin/bash

HERE="$(dirname "$(readlink -f "$0")")"

APTDEPS=(\
    git
    zsh
    tmux
    vim
    silversearcher-ag
    stow
    curl
    wget
    httpie
    gnupg2
    cryptsetup
    rar
    python3
    python3-pip
    python3-dev
    shellcheck
    htop
    ncdu
    ffmpeg
    cmus
    mpv\
)
PYDEPS=(\
    flake8
    virtualenv
    requests
    pdir2
    youtube-dl\
)

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

cd "$HERE"
git submodule update --recursive --remote

notify "Updating apt repositories ..."
for r in main universe multiverse restricted; do
    sudo add-apt-repository "$r"
done
sudo apt-get update

mkdir -p "${HOME}/bin"

notify "Installing software from apt ..."
sudo apt-get -y install "${APTDEPS[@]}"

notify "Upgrading pip3 ..."
python3 -m pip install --upgrade pip --user
notify "Installing software from pip3 ..."
python3 -m pip install "${PYDEPS[@]}" --user

if ask "Custom install nvm [github source]?"; then
    notify "Installing nvm from github repo ..."
    export NVM_DIR="${HOME}/.nvm" && (
      git clone https://github.com/creationix/nvm.git "$NVM_DIR"
      cd "$NVM_DIR"
      git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" origin)"
    )
fi

if ask "Custom install ngrok [binary blob]?"; then
    notify "Installing ngrok binary ..."
    NGROK="ngrok-stable-linux-amd64.zip"
    (cd "${HOME}/bin" \
     && wget "https://bin.equinox.io/c/4VmDzA7iaHb/${NGROK}" \
     && unzip "$NGROK" \
     && rm -f "$NGROK")
fi

exec zsh
