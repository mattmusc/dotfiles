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
sources+="$HOME/.sh/prompt.zsh"
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

#}}}
