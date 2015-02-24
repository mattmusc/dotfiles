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
# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;
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
        # Check for an interactive session
        [ -z "$PS1" ] && return

#        _PROMPT() {
#            _EXIT_STATUS=$?
#            [ $_EXIT_STATUS != 0 ] && _EXIT_STATUS_STR="\[\033[1;30m\][\[\033[1;31m\]$_EXIT_STATUS\[\033[1;30m\]] "
#            PS1="\033[1;30m\]» \[\e[0;33m\]fu\033[1;30m\]╺─╸$_EXIT_STATUS_STR\[\033[1;30m\][\[\033[0m\]\W\[\033[1;30m\]]\[\033[1;34m\];\[\033[0m\] "
#            unset _EXIT_STATUS_STR
#        }
#
#        PROMPT_COMMAND=_PROMPT

        #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
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
