# ---------------------------------------------------------------------------
# BashRC
# @author matteo.muscella@usi.ch
# ---------------------------------------------------------------------------

# {{{ Init

[ -f "$HOME/.environment" ] && source "$HOME/.environment"

[[ $- != *i* ]] && return

[ -f "$HOME/.aliases" ]     && source "$HOME/.aliases"
[ -f "$HOME/.functions" ]   && source "$HOME/.functions"

[ -f "$HOME/.custom" ]      && source "$HOME/.custom"

# }}}
# {{{ Options

shopt -s cdspell extglob

export HISTSIZE=100
HISTCONTROL=ignorespace:ignoredups
export HISTIGNORE="ls:passwd: "

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o default -o nospace -W \
    "$(grep "^Host" ~/.ssh/config | \
    grep -v "[?*]" | \
    cut -d " " -f2)" scp sftp ssh

# }}}
# Colors {{{

txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
bakgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# }}}
# {{{ Color for man pages

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_me=$'\E[0m'           # end blinking
export LESS_TERMCAP_md=$'\E[01;34m'       # begin bold / blue
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[00;40;01;32m' # begin standout-mode (info box)
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[01;33m'       # begin underline

#}}}
# {{{ Prompt

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true

__stat() {
    local _last_status="$?"
    [[ $_last_status -gt 0 ]] && echo "$txtred$_last_status$txtrst " ||echo ""
}

# » Թ ─ ╼ ⶈ
prompt='» '
PROMPT_COMMAND='__git_ps1 "" " $txtred$prompt$txtrst " " $txtgrn$(echo ) %s $txtrst"'

#export PS1=" \W ─ "

# }}}

# vim: ft=sh fdm=marker
