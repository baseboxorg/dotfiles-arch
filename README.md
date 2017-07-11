# dotfiles
My personal configuration for Arch and Debian-based development environments.

TODO combine `dotfiles-arch` and `dotfiles-debian` into this repository.

### Organization

There are three top-level dotfile directories:

* `common/` contains distribution-agnostic dotfiles and common software configurations
* `arch/` contains Arch-specific dotfiles (e.g. `bspwm` configuration)
* `debian/` contains Debian-specific dotfiles (e.g. `apt` shell aliases)

`GNU stow` is used in the linking scripts to link the appropriate dotfile trees.

`.commonrc` in `common/` will source `~/.specificrc` which will be present in both `arch/` and `debian/`. This file serves to store all the distribution-specific shell aliases, functions and environment exports.

### Installation

`git clone --recursive` this repository.

Then for Debian-based environments, `./deb_install.sh && ./deb_link.sh`. For Arch-based environments, `./arch_install.sh && ./arch_link.sh`.
