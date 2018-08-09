# ---------------------------------------------------------------------------
# BashRC
# @author matteo.muscella@usi.ch
# ---------------------------------------------------------------------------
#set -x

# {{{ Init

[ -f "$HOME/.environment" ] && . $HOME/.environment

[[ $- != *i* ]] && return

[ -f "$HOME/.aliases" ]     && . $HOME/.aliases
[ -f "$HOME/.functions" ]   && . $HOME/.functions

[ -f "$HOME/.custom" ]      && . $HOME/.custom

# }}}
# {{{ Options

shopt -s cdspell extglob

export HISTSIZE=100
HISTCONTROL=ignorespace:ignoredups
export HISTIGNORE="ls:passwd: "

# }}}
# {{{ Completion

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
  if [ -d /home/matteo/usr/share/bash-completion/ ]; then
      . /home/matteo/usr/share/bash-completion/completions/bspc
  fi
fi

which -s brew
if [[ $? != 0 && -f $(brew --prefix)/etc/bash_completion ]]
then
    . $(brew --prefix)/etc/bash_completion.d/bash-builtins
    . $(brew --prefix)/etc/bash_completion.d/brew
    . $(brew --prefix)/etc/bash_completion.d/coreutils
    . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
    . $(brew --prefix)/etc/bash_completion.d/git-flow-completion.bash
    . $(brew --prefix)/etc/bash_completion.d/java
    . $(brew --prefix)/etc/bash_completion.d/make
    . $(brew --prefix)/etc/bash_completion.d/nmap
    . $(brew --prefix)/etc/bash_completion.d/npm
    . $(brew --prefix)/etc/bash_completion.d/python
    . $(brew --prefix)/etc/bash_completion.d/rsync
    . $(brew --prefix)/etc/bash_completion.d/screen
    . $(brew --prefix)/etc/bash_completion.d/sh
    . $(brew --prefix)/etc/bash_completion.d/ssh
    . $(brew --prefix)/etc/bash_completion.d/tmux
    . $(brew --prefix)/etc/bash_completion.d/youtube-dl.bash-completion
fi

test -f /usr/local/etc/bash_completion && . /usr/local/etc/bash_completion

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

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

# » Թ ─ ╼ ⶈ
prompt='»'

#export PS1=" \W ─ "
export PS1=" ${txtpur}\W ${txtblu}${prompt}${txtrst} "

# }}}

# vim: ft=sh fdm=marker
