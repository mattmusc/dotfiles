# -----------------------------------------------------------------------
# ZshRC
# @author matteo.muscella@usi.ch
# -----------------------------------------------------------------------

# Init {{{

sourceIfPresent() {
    [[ -z "$1" ]] && return
    [[ -f "$1" ]] && source "$1"
}

sourceIfPresent "$HOME/.environment"

[[ $- != *i* ]] && return

sourceIfPresent "$HOME/.aliases"
sourceIfPresent "$HOME/.custom"

# load the advanced completion system
autoload -Uz compinit && compinit

# load colors
autoload -Uz colors && colors

# load vcs info module
autoload -Uz vcs_info

# }}}
# Options {{{

# do not autoselect the first completion entry
unsetopt menu_complete

# disable flow control of the terminal
unsetopt flowcontrol

# interpret directory name as cd to that dir
setopt autocd

# show completion menu on succesive tab press
setopt auto_menu

# start completion at the cursor position
setopt complete_in_word

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
WORDCHARS=${WORDCHARS//[&.;\/\{\}\[\]-_]}

# add syntax zsh highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
sourceIfPresent "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# create symbols
ZSH_VCS_PROMPT_REPO=''
ZSH_VCS_PROMPT_AHEAD_='↑'
ZSH_VCS_PROMPT_BEHIND='↓'
ZSH_VCS_PROMPT_STAGED='✚'
ZSH_VCS_PROMPT_CONFLICTS='✖'
ZSH_VCS_PROMPT_UNSTAGED='●'
ZSH_VCS_PROMPT_UNTRACKED='…'
ZSH_VCS_PROMPT_STASHED='⚑'
ZSH_VCS_PROMPT_CLEAN='✔'

# enable git and svn info
zstyle ':vcs_info:*' enable             git svn
zstyle ':vcs_info:*' get-revision       true
zstyle ':vcs_info:*' check-for-changes  true
zstyle ':vcs_info:*' stagedstr          $ZSH_VCS_PROMPT_STAGED
zstyle ':vcs_info:*' unstagedstr        $ZSH_VCS_PROMPT_UNSTAGED
zstyle ':vcs_info:*' untrackedstr       $ZSH_VCS_PROMPT_UNTRACKED
zstyle ':vcs_info:*' formats            $ZSH_VCS_PROMPT_REPO' %b %u%c'

# }}}
# Completion {{{

# make sure the module complist is loaded
# this module allows to move the cursor around candidates
zmodload -i zsh/complist

# start menu selection if at least 4 ambiguous completions are produced
zstyle ':completion:*'              max-errors 1
zstyle ':completion:*'              completer _complete _approximate
zstyle ':completion:*'              menu select=1

# for all completions: grouping / headline / ...
zstyle ':completion:*'              verbose yes
zstyle ':completion:*:messages'     format \
                                    $'%B\e[01;35m -- %d -- \e[00;00m%b'
zstyle ':completion:*:warnings'     format \
                                    $'%B\e[01;31m -- no matches -- \e[00;00m%b'
zstyle ':completion:*:descriptions' format $'%B\e[01;34m -- %d -- \e[00;00m%b'
zstyle ':completion:*:corrections'  format $'%B\e[01;33m -- %d -- \e[00;00m%b'

# set the order of completion groups
zstyle ':completion:*:-command-'    group-order builtins functions commands

# set string to show when complete options
zstyle ':completion:*'              auto-description 'specify: %d'

# make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*'              select-prompt \
    '%SScrolling active: current selection at %p%s'

# set the style of completion
zstyle ':completion:*'              matcher-list '' \
                                                 'm:{a-z}={A-Z}' \
                                                 'm:{a-zA-Z}={A-Za-z}'

# display lists of matches in different colours
zstyle ':completion:*'                    list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors \
                                          '=(#b) #([0-9]#)*=0=01;31'

# ignore this file patterns in completion
zstyle ':completion:*:files'        ignored-patterns '*?.o' '*?~' '*?.dvi'
zstyle ':completion:*:functions'    ignored-patterns '_*'

# group completions according to tags
zstyle ':completion:*'              group-name ''

# specify group name
zstyle ':completion:*:*:-command-:*:commands'  group-name commands
zstyle ':completion:*:*:-command-:*:functions' group-name functions

# use normal file completion for specified commands
compdef -d npm

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

# perform history expansion and insert a space into the buffer.
bindkey " " magic-space

# }}}
# Prompt {{{

# set terminal title bar
__set_term_title() {
    print -Pn "\e]0;%~\a"
}

case $TERM in
    *rxvt*|xterm*)

        ZSHFG=`expr $RANDOM / 15`
        precmd () {
            __set_term_title

            # get vcs information
            vcs_info

            if [ $ZSHFG -ge 15 ]
            then
                ZSHFG=0
            fi

            ZSHFG=`expr $ZSHFG + 1`

            # » Թ ─ ╼ ⶈ ▬ — ▬
            PROMPT="%{%F{$ZSHFG}%}${vcs_info_msg_0_%% } ▬ %f"
            RPS1="%F{$ZSHFG}%2~/%f"
        }
        ;;
esac

# }}}

# vim: ft=sh fdm=marker

