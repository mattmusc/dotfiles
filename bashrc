# ------------------------------------------------------------------------
# BashRC
# @author matteo.muscella@usi.ch
# ------------------------------------------------------------------------
source $HOME/.sh/exports
source $HOME/.sh/aliases
# {{{ Options
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
# {{{ Autocompletion -----------------------------------------------------
complete -cf sudo
complete -cf man
# }}}
# {{{ Prompt -------------------------------------------------------------
case "$TERM" in
    *)
       PS1='\W $ '
       ;;
esac
# }}}
# {{{ Options
set editing-mode emacs
# }}}
# end --
