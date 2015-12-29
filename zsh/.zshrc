# -----------------------------------------------------------------------
# ZshRC
# @author matteo.muscella@usi.ch
# -----------------------------------------------------------------------

# Init {{{

[[ -f "$HOME/.environment" ]] && source "$HOME/.environment"

[[ $- != *i* ]] && return

[[ -f "$HOME/.aliases"     ]] && source "$HOME/.aliases"
[[ -f "$HOME/.custom"      ]] && source "$HOME/.custom"
# }}}

# set emacs editing mode
bindkey -e

# do not autoselect the first completion entry
unsetopt menu_complete

unsetopt flowcontrol

# show completion menu on succesive tab press
setopt auto_menu

setopt complete_in_word

setopt always_to_end

zmodload -i zsh/complist

zstyle ':completion:*:*:*:*:*' menu select

# for all completions: grouping / headline / ...
zstyle ':completion:*:messages' format $'\e[01;35m -- %d -- \e[00;00m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --
\e[00;00m'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d -- \e[00;00m'
zstyle ':completion:*:corrections' format $'\e[01;33m -- %d -- \e[00;00m'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# kill: advanced kill completion
zstyle ':completion::*:kill:*:*' command 'ps xf -U $USER -o pid,%cpu,cmd'
zstyle ':completion::*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'

autoload -U compinit && compinit

# / - slash - not considered part of word
WORDCHARS=${WORDCHARS//[&.;\/]}

# set terminal title bar
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%~\a"}
        ;;
esac

# vim: ft=sh fdm=marker
