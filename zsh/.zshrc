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
# Options {{{

# do not autoselect the first completion entry
unsetopt menu_complete

# disable flow control of the terminal
unsetopt flowcontrol

# show completion menu on succesive tab press
setopt auto_menu

# start completion at the cursor position
setopt complete_in_word

# move the cursor to end of word if completion is started
setopt always_to_end

# expand aliases
setopt complete_aliases

# append a slash to a parameter expression
setopt auto_param_slash

# delete intervening characters - } - for parameters
setopt auto_param_keys

# indentify completion candidates as:
# / for directories
# * for regular executable file
# @ for link
# | for named pipe
# % for character device
# # for block device
setopt list_types

# do not append a command in history if starts with space
setopt hist_ignore_space

# do not append duplicate commands in history
setopt hist_ignore_dups

# do not save duplicate commands
setopt hist_save_no_dups

# do not consider / - slash - part of a word
WORDCHARS=${WORDCHARS//[&.;\/\{\}\[\]]}

# add syntax zsh highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
[[ -d "/usr/local/share/zsh-syntax-highlighting" ]] && \
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# }}}
# Completion {{{

# load the advanced completion system
autoload -U compinit && compinit

# make sure the module complist is loaded
# this module allows to move the cursor around candidates
zmodload -i zsh/complist

# start menu selection if at least 4 ambiguous completions are produced
zstyle ':completion:*'              menu select=1 _complete _correct

# for all completions: grouping / headline / ...
zstyle ':completion:*'              verbose yes
zstyle ':completion:*:messages'     format $'%B\e[01;35m -- %d -- \e[00;00m%b'
zstyle ':completion:*:warnings'     format \
    $'%B\e[01;31m -- no matches -- \e[00;00m%b'
zstyle ':completion:*:descriptions' format $'%B\e[01;34m -- %d -- \e[00;00m%b'
zstyle ':completion:*:corrections'  format $'%B\e[01;33m -- %d -- \e[00;00m%b'

# set the order of completion groups
zstyle ':completion:*:-command-'    group-order builtins functions commands

# set string to show when complete options
zstyle ':completion:*'              auto-description 'specify: %d'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*'              select-prompt \
    '%SScrolling active: current selection at %p%s'

# set the style of completion
zstyle ':completion:*'              matcher-list '' \
    'm:{a-z}={A-Z}' \
    'm:{a-zA-Z}={A-Za-z}' \

# display lists of matches in different colours
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors \
    '=(#b) #([0-9]#)*=0=01;31'

# ignore this file patterns in completion
zstyle ':completion:*:files' ignored-patterns '*?.o' '*?~' '*?.dvi'
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*:functions' ignored-patterns '_*'

# group completions according to tags
zstyle ':completion:*'                         group-name ''
zstyle ':completion:*:*:-command-:*:commands'  group-name commands
zstyle ':completion:*:*:-command-:*:functions' group-name functions

# }}}
# History {{{

export HISTSIZE=10000
export SAVEHIST=9000
export HISTFILE=~/.zsh_history

# }}}
# Keys {{{

# set emacs editing mode
bindkey -e

# accepts completion and tries co complete again
bindkey -M menuselect '^o' accept-and-infer-next-history

# }}}
# Prompt {{{

# set terminal title bar
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%~\a"}
        ;;
esac

# }}}

# vim: ft=sh fdm=marker

