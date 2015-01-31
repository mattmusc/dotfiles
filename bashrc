# ---------------------------------------------------------------------------
# BashRC
# @author matteo.muscella@usi.ch
# ---------------------------------------------------------------------------
# {{{ Imports
source $HOME/.sh/environment.zsh
source $HOME/.sh/aliases.zsh
# }}}
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
# }}}
# {{{ Autocompletion
complete -cf sudo
complete -cf man
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
    *term* | *rxvt* | vt100)
        PS1="▬ "
        ;;
    dumb | emacs)
        PROMPT="%m:%~> "
        ;;
    *)
       PS1="\W $ "
       ;;
esac
# }}}
# end --
