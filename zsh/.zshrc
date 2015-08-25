# -----------------------------------------------------------------------
# ZshRC
# @author matteo.muscella@usi.ch
# -----------------------------------------------------------------------

# Init {{{
autoload -Uz compinit colors
compinit
colors

setopt nocheckjobs correct completealiases autocd \
    cdablevars auto_menu complete_in_word

unsetopt BG_NICE menu_complete

[[ -f "$HOME/.environment" ]] && source "$HOME/.environment"
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.custom" ]] && source "$HOME/.custom"
# }}}
# Style {{{
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# }}}
# Options {{{

# History
## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=200
SAVEHIST=200

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# }}}
# Prompt {{{

case "$TERM" in
    *term*|rxvt*|screen*)
        PS1="%{$fg[blue]%}~%{$reset_color%} %{$fg[red]─%}%{$reset_color%} "
        #PS1="\[$txtblu\] \W \[$txtred\]»\[$txtrst\] "
        ;;
    dumb)
        PS1="\n>>> "
        ;;
esac

# }}}

# vim: ft=sh fdm=marker
