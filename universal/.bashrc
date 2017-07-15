[ -z "$PS1" ] && return

# Source common (bash+zsh compat) shell aliases, environment and functions.
. "${HOME}/.commonrc"

# Bash 4 specific miscellany below.

[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"

set -o noclobber  # use >| to force redirection overwrite

shopt -s extglob
shopt -s nullglob
shopt -s nocaseglob
shopt -s globstar  # ** recursive globbing
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s no_empty_cmd_completion
shopt -s checkwinsize

bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"
bind "set mark-symlinked-directories on"

export PROMPT_COMMAND="history -a"
export HISTFILESIZE=1000000
export HISTFILE="${HOME}/.bash_history"
export HISTSIZE="$HISTFILESIZE"
export SAVEHIST="$HISTSIZE"
export HISTTIMEFORMAT="%F %T "
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:cd"
shopt -s cmdhist
shopt -s histappend
bind Space:magic-space
