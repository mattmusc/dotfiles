# Aliases
# @author matteo.muscella@usi.ch
#

# a quick way to get out of current directory
alias ..='cd ..'

alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

alias cl="cd ~/Dropbox/USI/Classes"
alias sem="cd ~/SpringSem2015"
alias P="cd ~/Dropbox/Programming"
alias dots="cd ~/.dotfiles"
alias configs="cd $XDG_CONFIG_HOME"

alias sc="source ~/.zshrc"

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias update='brew cleanup && brew update && brew upgrade && brew cleanup && brew doctor'
alias addSpacer="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type=\"spacer-tile\";}' ; killall Dock"

# list top ten largest files/directories in current directory
alias ducks='du -cks *|sort -rn|head -11'

alias gst='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
alias gd='git diff'
alias gdt='git difftool'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gco='git checkout'
alias gcm='git checkout master'
alias gr='git remote'
alias grv='git remote -v'
alias gb='git branch'
alias glg='git log --stat --max-count=10'
alias glgg='git log --graph --max-count=10'
alias glgga='git log --graph --decorate --all'
alias glo='git log --oneline --decorate --color'
alias glog='git log --oneline --decorate --color --graph'
alias gss='git status -s'
alias ga='git add'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

alias extip='curl -s ifconfig.me'
alias iamhome='[ `curl -s ifconfig.me` = "2.235.177.223" ]'

alias start_mysql='/usr/local/opt/mysql/bin/mysqld_safe &'
