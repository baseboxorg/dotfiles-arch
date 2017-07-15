ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="gianu"
plugins=(globalias command-not-found wd colored-man-pages)

# activate oh-my-zsh
. "${ZSH}/oh-my-zsh.sh"

# clearing all aliases to remove default zsh aliases
unalias -m "*"

# Source common (bash+zsh compat) shell aliases, environment and functions.
. "${HOME}/.commonrc"

# zsh specific miscellany below.
# Some things might already be set my oh-my-zsh, in which case
# they are overridden here.

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz compinit
setopt COMPLETE_IN_WORD
setopt PATH_DIRS
unsetopt CASE_GLOB

setopt AUTO_CD
setopt NULL_GLOB
setopt RM_STAR_WAIT

alias -g C="| xclip -i"
alias -g G="| grep"
alias -g H="| head"
alias -g L="| less"
alias -g T="| tail"
alias -g N="/dev/null"
alias -g R="/dev/urandom"
alias -g Z="/dev/zero"

alias history='fc -l'
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST="$HISTSIZE"
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:ls:history"
setopt BANG_HIST
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
