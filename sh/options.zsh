ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
#source ~/.sh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

setopt correct
setopt auto_menu
setopt extendedglob
setopt menu_complete

# completion options
#autoload -U compinit && compinit
#zstyle ':completion:*' completer _complete _correct _approximate
#zstyle ':completion:*' menu select
#zstyle ':completion:*' menu select=20
#zstyle ':completion:*:cd:*' tag-order local-directories path-directories

# keys
export WORDCHARS=${WORDCHARS//[&.;\/]}
bindkey -e

