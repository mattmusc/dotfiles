###
### ZshRC
### author matteo.muscella@usi.ch
###

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

plugins=(git svn vagrant)

# User configuration
if [[ -f "$HOME/.sh/environment.zsh" ]]
then
    source "$HOME/.sh/environment.zsh"
fi

source $ZSH/oh-my-zsh.sh

if [[ -f "$HOME/.sh/aliases.zsh" ]]
then
    source "$HOME/.sh/aliases.zsh"
fi

# Syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
source ~/.sh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source custom file
if [[ -f "$HOME/.custom.zsh" ]]
then
    source $HOME/.custom.zsh
fi

