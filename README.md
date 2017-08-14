# dotfiles
My personal configuration for Arch development environments (more coming soon).

For server environments (non-graphical; just pure terminal emulator and command line usage), use the much lighter and stripped down [dotfiles-server-arch](https://github.com/JoshuaRLi/dotfiles-server-arch) or [dotfiles-server-debian](https://github.com/JoshuaRLi/dotfiles-server-debian).

**NOTE:** Arch + universal dotfiles are **not** finalized yet. This repository is a work in progress.


### Organization

The organization of this repository has been designed to flexibly accomodate multiple distributions.

So far, there are two top level dotfile directories:

* `universal/`: distribution-agnostic dotfiles and software configurations
* `arch/`: Arch-specific dotfiles (e.g. `bspwm` configuration)

`universal/.commonrc` sources `.specificrc`, a file present in every distribution-specific folder. It should store all the distribution-specific shell aliases, functions and environment exports.

The process of supporting a new distribution would be to simply create a top level directory like `debian/` with a `.specificrc` file inside it, and a software install script like `install-debian.sh`.


### Installation

If you are going to actually use my dotfiles, I recommend reading over everything to understand how exactly I have configured my machine. This way, you are prepared to make the appropriate changes for your own needs. Things are not exactly plug-and-play.

`git clone --recursive git@github.com:JoshuaRLi/dotfiles.git`, then...

For Arch-based environments: `install-arch.sh && link.sh universal arch`

To test installs on Arch, I have created a `base/devel`-based [docker image](https://hub.docker.com/r/joshuarli/archbase/) preloaded with a "josh" sudo-enabled user, `zsh` and these dotfiles. Use it with `docker run -it joshuarli/archbase`.


### Backup/Restore and Uninstall

If `link.sh` encounters existing dotfiles while creating symlinks, it will make backups suffixed with `.stow-bak`. 

To remove all dotfile symlinks, simply `unlink.sh` with no arguments. If there is an existing `.stow.bak` match, that file will be restored by removing the backup suffix.

**Important:** This backup/restore functionality has not been thoroughly tested; it is a poor hack that I threw together because GNU stow does not have this functionality built-in. I would advise to use caution with my linking and unlinking scripts.


### Software Stack

Dev stack (Universal):

```
TODO
```

Rice stack (Arch):

```
bspwm                       ➔ window manager
cava                        ➔ audio visualization
compton                     ➔ display compositor
dunst                       ➔ notifications
i3lock                      ➔ screen lock
irssi                       ➔ IRC client
mpd + mpc + ncmpcpp         ➔ music
mpv                         ➔ media player
neofetch                    ➔ system information
polybar (+ libmpdclient)    ➔ status bars
ranger + highlight + w3m    ➔ file browser
redshift                    ➔ screen filter
rofi                        ➔ launcher
scrot, maim                 ➔ screenshot
sxhkd                       ➔ keybindings
sxiv                        ➔ image viewer
urxvt                       ➔ terminal emulator
wal                         ➔ color theming
zathura                     ➔ document viewer
zsh                         ➔ shell
```
