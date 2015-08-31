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
[[ -f "$HOME/.aliases"     ]] && source "$HOME/.aliases"
[[ -f "$HOME/.custom"      ]] && source "$HOME/.custom"
# }}}
# Style {{{

# Speed up completion by avoiding partial globs.
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' accept-exact-dirs true

# Cache setup.
zstyle ':completion:*' use-cache on

# Default colors for listings.
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'

# Separate directories from files.
zstyle ':completion:*' list-dirs-first true

# Turn on menu selection only when selections do not fit on screen.
zstyle ':completion:*' menu true=long select=long

# Separate matches into groups.
zstyle ':completion:*:matches' group yes
zstyle ':completion:*' group-name ''

# Always use the most verbose completion.
zstyle ':completion:*' verbose true

# Treat sequences of slashes as single slash.
zstyle ':completion:*' squeeze-slashes true

# Describe options.
zstyle ':completion:*:options' description yes

# Completion presentation styles.
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[1m -- %d --\e[22m'
zstyle ':completion:*:messages'     format $'\e[1m -- %d --\e[22m'
zstyle ':completion:*:warnings'     format $'\e[1m -- No matches found --\e[22m'

# Ignore hidden files by default
zstyle ':completion:*:(all-|other-|)files'  ignored-patterns '*/.*'
zstyle ':completion:*:(local-|)directories' ignored-patterns '*/.*'
zstyle ':completion:*:cd:*'                 ignored-patterns '*/.*'

# Don't complete completion functions/widgets.
zstyle ':completion:*:functions' ignored-patterns '_*'

# cd style.
zstyle ':completion:*:cd:*' ignore-parents parent pwd # cd never selects the parent directory (e.g.: cd ../<TAB>)
zstyle ':completion:*:*:cd:*' tag-order local-directories path-directories

# kill style.
zstyle ':completion:*:*:kill:*' command 'ps -a -w -w -u $USER -o pid,cmd --sort=-pid'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=39=32"

# rm/cp/mv style.
zstyle ':completion:*:(rm|mv|cp):*' ignore-line yes

# }}}
# Options {{{

# Command history configuration
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
        PS1="%{$fg[blue]%}%~ %{$fg[red]%}─%{$reset_color%} "
        #PS1="\[$txtblu\] \W \[$txtred\]»\[$txtrst\] "
        ;;
    dumb)
        PS1="\n>>> "
        ;;
esac

# }}}
# Keys {{{
bindkey -e

WORDCHARS=${WORDCHARS//[&.;\/]}

[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char
# for rxvt
bindkey      "e[8~"      end-of-line
bindkey      "e[7~"      beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey      "eOH"       beginning-of-line
bindkey      "eOF"       end-of-line
# for freebsd console
bindkey      "e[H"       beginning-of-line
bindkey      "e[F"       end-of-line
# completion in the middle of a line
bindkey      "^i"        expand-or-complete-prefix
bindkey      "^[[3~"     delete-char
bindkey      "^[3;5~"    delete-char
# }}}

# vim: ft=sh fdm=marker
