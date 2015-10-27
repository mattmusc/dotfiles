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
# Antigen {{{
source /Users/mm/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme agnoster

antigen apply
# }}}

# vim: ft=sh fdm=marker
