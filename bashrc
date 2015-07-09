# ---------------------------------------------------------------------------
# BashRC
# @author matteo.muscella@usi.ch
# ---------------------------------------------------------------------------
# {{{ Init

if [ -f $HOME/.sh/environment.zsh ]; then
    source $HOME/.sh/environment.zsh
fi
if [ -f $HOME/.sh/function.zsh ]; then
    source $HOME/.sh/function.zsh
fi
[[ $- != *i* ]] && return

# }}}
# {{{ Options

set editing-mode emacs
shopt -s extglob
shopt -u gnu_errfmt
shopt -u histappend
shopt -u histreedit
shopt -u histverify
shopt -u huponexit
shopt -s login_shell
shopt -u nocasematch
shopt -u nullglob
shopt -s expand_aliases

# }}}
# {{{ Color for man pages

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_me=$'\E[0m'           # end blinking
export LESS_TERMCAP_md=$'\E[01;34m'       # begin bold / blue
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_so=$'\E[00;40;01;32m' # begin standout-mode (info box)
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_us=$'\E[01;33m'       # begin underline
export LESS_TERMCAP_ue=$'\E[0m'           # end underline

#}}}
# {{{ Prompt

case "$TERM" in
    *term*|rxvt*)
        PS1="\w \$ "
        ;;
    dumb)
        PS1="\n>>> "
        ;;
esac

# }}}
# {{{ Aliases

if [ -f $HOME/.sh/aliases.zsh ]; then
    source $HOME/.sh/aliases.zsh
fi

# }}}
