# Syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
source ~/.sh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# colored man pages
man() {
  env \
      LESS_TERMCAP_mb=$(printf "\e[38;5;146m") \
      LESS_TERMCAP_md=$(printf "\e[38;5;3m")   \
      LESS_TERMCAP_me=$(printf "\e[38;5;138m") \
      LESS_TERMCAP_se=$(printf "\e[38;5;246m") \
      LESS_TERMCAP_so=$(printf "\e[38;5;146m") \
      LESS_TERMCAP_ue=$(printf "\e[38;5;246m") \
      LESS_TERMCAP_us=$(printf "\e[38;5;174m") \
   man "$@"
}

zstyle ':completion:*' menu select=1
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format '%d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -c -u $USER -o pid,%cpu,cputime,state,comm'

