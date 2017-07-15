# dotfiles
My personal configuration for Arch and Debian-based development environments.

### Organization

There are three top-level dotfile directories:

* `universal/` contains distribution-agnostic dotfiles and software configurations
* `arch/` contains Arch-specific dotfiles (e.g. `bspwm` configuration)
* `debian/` contains Debian-specific dotfiles (e.g. `apt` shell aliases)

`.commonrc` in `common/` will source `~/.specificrc` which will be present in both `arch/` and `debian/`. This file serves to store all the distribution-specific shell aliases, functions and environment exports.

### Installation

`git clone --recursive` this repository.

For Debian-based environments, you'll want to `install-debian.sh && link.sh universal debian`.

For Arch-based environments, you'll want to `install-arch.sh && link.sh universal arch`.

To remove all symlinks to dotfiles set by GNU stow, simply `unlink.sh` with no arguments.

### Software Stack (Arch)

Rice stack:

```
bspwm           ➔ window manager
cava            ➔ audio visualization (TODO)
compton         ➔ display compositor
dunst           ➔ notifications
i3lock          ➔ screen lock
irssi           ➔ IRC client (TODO)
mpd + ncmpcpp   ➔ music (TODO)
mpv             ➔ video player (TODO)
neofetch        ➔ system information
polybar         ➔ status bars
ranger          ➔ file browser (TODO)
redshift        ➔ screen filter
rofi            ➔ launcher
rtorrent        ➔ torrent client
scrot, maim     ➔ screenshot
sxhkd           ➔ keybindings
sxiv            ➔ image viewer
urxvt           ➔ terminal emulator
wal             ➔ X colors (TODO pywal)
zathura         ➔ document viewer (TODO)
zsh             ➔ shell
```

Dev stack:

```
TODO
```

### Software Stack (Debian)

TODO format below prettily.

**Dev**

* [apt] git
* [apt] zsh
* [apt] tmux
* [apt] vim
* [apt] silversearcher-ag
* [apt] stow
* [apt] curl
* [apt] wget
* [apt] httpie
* [apt] gnupg2
* [apt] cryptsetup
* [apt] rar
* [apt] python3
  * [apt] python3-pip
  * [apt] python3-dev
  * [pip] flake8
  * [pip] virtualenv
  * [pip] requests
  * [pip] pdir2
* [apt] shellcheck
* [github source] nvm
* [binary blob] ngrok

**System**

* [apt] htop
* [apt] ncdu

**CLI apps/tools**

* [apt] ffmpeg
* [apt] cmus (music player)
* [apt] mpv (video player)
    - Note: official repos have outdated mpv, might want to manually upgrade via official git repo release
* [pip] youtube-dl (youtube downloader)
