# ---------------------------------------------------------------------------
# BashRC
# @author matteo.muscella@usi.ch
# vim: fdm=marker
# ---------------------------------------------------------------------------
# {{{ Init

[ -f  "$HOME/.environment" ] && source "$HOME/.environment"
[ -f  "$HOME/.aliases"     ] && source "$HOME/.aliases"
[ -f  "$HOME/.functions"   ] && source "$HOME/.functions"


[[ $- != *i* ]] && return

# }}}
# {{{ Options

for opt in cdspell dotglob extglob \
        no_empty_cmd_completion; do
    shopt -s $opt
done

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

# colors
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

case "$TERM" in
    *term*|rxvt*|screen*)
        #PS1="\[$txtblu\]\W\[$txtrst\] \[$txtred\]─\[$txtrst\] "
        PS1="\[$txtblu\] \W \[$txtred\]»\[$txtrst\] "
        ;;
    dumb)
        PS1="\n>>> "
        ;;
esac

# }}}
