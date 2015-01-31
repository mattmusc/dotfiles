# ---------------------------------------------------------------------------
# BashRC
# @author matteo.muscella@usi.ch
# ---------------------------------------------------------------------------
if [ -f $HOME/.sh/environment.zsh ]; then
    source $HOME/.sh/environment.zsh
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
# Prompt
#export PS1="\[$(tput setaf 1)\]┌─╼ \[$(tput setaf 14)\][\w]\n\[$(tput setaf 1)\]\[$(tput setaf 1)\]└╼ \[$(tput setaf 14)\]"

#trap 'echo -ne "\e[0m"' DEBUG

# I this is an xterm set the title to user@host:dir
# Old: PS1="▬ "
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
        ;;
    dumb | emacs)
        PROMPT="%m:%~> "
        ;;
    *)
        PS1="\W $ "
        ;;
esac
# }}}
if [ -f $HOME/.sh/aliases.zsh ]; then
    source $HOME/.sh/aliases.zsh
fi
# end --
