###
### ZshRC
### author matteo.muscella@usi.ch
###

if [[ -f "$HOME/.sh/environment.zsh" ]]
then
    source "$HOME/.sh/environment.zsh"
fi

if [[ -f "$HOME/.sh/aliases.zsh" ]]
then
    source "$HOME/.sh/aliases.zsh"
fi

if [[ -f "$HOME/.sh/options.zsh" ]]
then
    source "$HOME/.sh/options.zsh"
fi

# source custom file
if [[ -f "$HOME/.custom.zsh" ]]
then
    source $HOME/.custom.zsh
fi

