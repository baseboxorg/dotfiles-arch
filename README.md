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
