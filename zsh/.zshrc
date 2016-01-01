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
zstyle ':completion:*::::'          completer _expand \
    _complete _ignored _approximate
zstyle ':completion:*'              menu select=1 \
    _complete _ignored _approximate

# for all completions: grouping / headline / ...
zstyle ':completion:*'              verbose yes
zstyle ':completion:*:messages'     format $'%B\e[01;35m -- %d -- \e[00;00m%b'
zstyle ':completion:*:warnings'     format \
    $'%B\e[01;31m -- no matches for: %d -- \e[00;00m%b'
zstyle ':completion:*:descriptions' format $'%B\e[01;34m -- %d -- \e[00;00m%b'
zstyle ':completion:*:corrections'  format $'%B\e[01;33m -- %d -- \e[00;00m%b'

# group completions according to tags
zstyle ':completion:*'              group-name ''

# set the order of completion groups
zstyle ':completion:*:-command-'    group-order builtins functions commands
zstyle ':completion:*'              auto-description 'specify: %d'

#zstyle ':completion:*'              list-prompt %SAt \
#                          %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*'              matcher-list '' \
                                                 'm:{a-z}={A-Z}' \
                                                 'm:{a-zA-Z}={A-Za-z}' \
                                                 'r:|[._-]=* r:|=* l:|=*'

# display lists of matches in different colours
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors \
    '=(#b) #([0-9]#)*=0=01;31'

# ignore this file patterns in completion
zstyle ':completion:*:files' ignored-patterns '*?.o' '*?~' '*?.dvi'
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*:functions' ignored-patterns '_*'

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

