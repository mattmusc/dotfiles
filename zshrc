###
### ZshRC
### author matteo.muscella@usi.ch
###
#{{{ ZSH Init

autoload -Uz compinit colors zmv
compinit
colors
unsetopt BG_NICE menu_complete

typeset -ga sources
sources+="$HOME/.sh/environment.zsh"
sources+="$HOME/.sh/functions.zsh"
sources+="$HOME/.sh/options.zsh"
sources+="$HOME/.sh/aliases.zsh"

HISTFILE=~/.zsh-history
SAVEHIST=256
HISTSIZE=256

# try to include all sources
foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end

# prompt
case $TERM in

	urxvt*)
		ZSHFG=`expr $RANDOM / 15`
		precmd () {
  			psvar=()
  			LANG=en_US.UTF-8

  			if [ $ZSHFG -ge 15 ]
  			then
    			ZSHFG=0
  			fi

  			ZSHFG=`expr $ZSHFG + 1`

  			PROMPT="%{%B%F{$ZSHFG}%} ▬ "
  			RPS1="%B%F{$ZSHFG}%~%b%f"
		}
esac

#}}}
