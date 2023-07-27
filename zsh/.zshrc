#!/bin/zsh

alias :r='source ~/.zshrc'
alias ls='ls --color'
alias ll='ls -lha'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e

zstyle :compinstall filename '/home/mattmusc/.zshrc'

autoload -Uz compinit
compinit


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.zplug/init.zsh
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
SPACESHIP_PROMPT_ASYNC=false
zplug load

