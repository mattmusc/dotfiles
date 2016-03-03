# -----------------------------------------------------------------------
# ZshRC
# @author matteo.muscella@usi.ch
# -----------------------------------------------------------------------

sourceIfPresent() {
    [[ -z "$1" ]] && return
    [[ -f "$1" ]] && source "$1"
}

sourceIfPresent "$HOME/.environment"

[[ $- != *i* ]] && return

sourceIfPresent "$HOME/.aliases"
sourceIfPresent "$HOME/.custom"

autoload -U colors && colors

[[ -d "$HOME/.antigen" ]] || \
    git clone https://github.com/zsh-users/antigen.git $HOME/.antigen

. $HOME/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle vagrant

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster

# Tell antigen that you're done.
antigen apply

# vim: ft=sh fdm=marker

