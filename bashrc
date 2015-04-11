# ---------------------------------------------------------------------------
# BashRC
# @author matteo.muscella@usi.ch
# ---------------------------------------------------------------------------
if [ -f $HOME/.sh/environment.zsh ]; then
    source $HOME/.sh/environment.zsh
fi
if [ -f $HOME/.sh/function.zsh ]; then
    source $HOME/.sh/function.zsh
fi
[[ $- != *i* ]] && return
# {{{ Options
set editing-mode emacs
shopt -s extglob
shopt -s force_fignore
shopt -u gnu_errfmt
shopt -u histappend
shopt -u histreedit
shopt -u histverify
shopt -s hostcomplete
shopt -u huponexit
shopt -s interactive_comments
shopt -u lithist
shopt -s login_shell
shopt -u mailwarn
shopt -u no_empty_cmd_completion
shopt -u nocaseglob
shopt -u nocasematch
shopt -u nullglob
shopt -s progcomp
shopt -s promptvars
shopt -u restricted_shell
shopt -u shift_verbose
shopt -s sourcepath
shopt -u xpg_echo
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
# }}}
# {{{ Autocompletion

complete -cf sudo
complete -cf man

_runhaskell()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "*.hs" -- $cur) )
}
complete -F _runhaskell runhaskell

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
    xterm*|rxvt*)
        ;;
    dumb | emacs)
        PROMPT="%m:%~> "
        ;;
esac
# }}}
if [ -f $HOME/.sh/aliases.zsh ]; then
    source $HOME/.sh/aliases.zsh
fi
# end --
