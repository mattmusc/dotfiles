# Aliases
# @author matteo.muscella@usi.ch
#
# {{{ cd

# get rid of command not found
alias cd..='cd ..'
 
# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'

# }}}
# {{{ ls

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
        colorflag="--color"
else # OS X `ls`
        colorflag="-G"
fi
# List all files colorized in long format
alias l="ls -lF ${colorflag}"
# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"
# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
alias ll="ls -lF ${colorflag}"
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
# Always use color output for `ls`
alias ls="command ls ${colorflag}"

alias l.="find . -maxdepth 1 -type f -name '.*'"

# }}}
# {{{ shortcuts

#alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs &"

alias cl="cd ~/Dropbox/USI/Classes"
alias sem="cd ~/Dropbox/USI/Classes/FallSem2014-2015"
alias P="cd ~/Dropbox/Programming"
alias dots="cd ~/Dotfiles"
alias configs="cd $XDG_CONFIG_HOME"

alias ez="vim ~/.zshrc"
alias ea="vim ~/.aliases"
alias ee="vim ~/.exports"
alias ev="vim ~/.vimrc"
alias el="vim ~/.latexmkrc"
alias egi="vim ~/.gitignore_global"
alias egc="vim ~/.gitconfig"
alias emt="vim ~/.muttrc"
alias empd="vim ~/.mpd.conf"

alias solrdir="cd $(brew --prefix)/solr/4.10.0/libexec/example/"

alias sc="source ~/.zshrc"

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias update='brew cleanup && brew update && brew upgrade && brew cleanup && brew doctor'

alias backupUsiTen='rsync -rltDv --stats ~/Pictures/Lightroom.Archive/ /Volumes/MUSCIHDD/Backup ; rsync -rltDv --stats ~/Documents/Projects/ /Volumes/MUSCIHDD/Backup'

# }}}
# {{{ ssh machines

alias atelier="ssh muscellm@atelier.inf.usi.ch"
alias qnaphome="ssh admin@192.168.2.10"

# }}}
# {{{ net

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# }}}
# {{{  misc

alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias da='date "+%A, %B %d, %Y [%T]"'

# mac specific
alias addSpacer="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type=\"spacer-tile\";}' ; killall Dock"

# }}}
# {{{ filesystem

# list top ten largest files/directories in current directory
alias ducks='du -cks *|sort -rn|head -11'

# }}}
# {{{ suffix

alias -s {jpg,png,gif}='open'
alias -s {txt,c,h,conf,tex,vim,zsh,sh,py}='vim'

# }}}
