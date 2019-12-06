#!/bin/zsh
# -----------------------------------------------------------------------
# ZshRC
# @author matteo.muscella@usi.ch
# -----------------------------------------------------------------------

source ~/.aliases
source ~/.environment

autoload -Uz compinit && compinit

zstyle ':completion:*' menu select

setopt COMPLETE_ALIASES

autoload -U promptinit; promptinit
prompt pure

# vim: ft=sh fdm=marker

