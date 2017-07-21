# dotfiles
My personal configuration for Arch and Debian-based development environments.

### Organization

There are three top-level dotfile directories:

* `universal/`: distribution-agnostic dotfiles and software configurations
* `arch/`: Arch-specific dotfiles (e.g. `bspwm` configuration)
* `debian/`: Debian-specific dotfiles (e.g. `apt` shell aliases)

`universal/.commonrc` will source `~/.specificrc`, a file present in both `arch/` and `debian/`. This file stores all the distribution-specific shell aliases, functions and environment exports.

### Installation

`git clone --recursive git@github.com:JoshuaRLi/dotfiles.git`, then...

For Arch-based environments: `install-arch.sh && link.sh universal arch`
For Debian-based environments: `install-debian.sh && link.sh universal debian`

If `stow` encounters existing dotfiles while making symlinks, it will make backups suffixed with `.stow.bak`. 

To remove all symlinks to dotfiles set by GNU stow, simply `unlink.sh` with no arguments. If there is an existing `.stow.bak` match, that file will be restored by removing the backup suffix.

### Software Stack (Arch)

Rice stack:

```
bspwm                       ➔ window manager
cava                        ➔ audio visualization (TODO)
compton                     ➔ display compositor
dunst                       ➔ notifications
i3lock                      ➔ screen lock
irssi                       ➔ IRC client (TODO)
mpd + ncmpcpp               ➔ music (TODO)
mpv                         ➔ video player (TODO)
neofetch                    ➔ system information
polybar (+libmpdclient)     ➔ status bars
ranger                      ➔ file browser (TODO)
redshift                    ➔ screen filter
rofi                        ➔ launcher
rtorrent                    ➔ torrent client
scrot, maim                 ➔ screenshot
sxhkd                       ➔ keybindings
sxiv                        ➔ image viewer
urxvt                       ➔ terminal emulator
wal                         ➔ color theming
zathura                     ➔ document viewer (TODO)
zsh                         ➔ shell
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
