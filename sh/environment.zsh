###
# Exports
# @author matteo.muscella@usi.ch
###

[ "$SHELL" = "/bin/zsh" ] && export ZSH_CACHE="~/.zsh-cache"

HISTCONTROL=ignorespace
export HISTIGNORE="ls:passwd: "

export XDG_CONFIG_HOME="$HOME/.config"

case $(uname) in
    "Darwin" )
        export JAVA_HOME=`$(dirname $(readlink $(which javac)))/java_home`
        ;;
    "Linux" )
        export JAVA_HOME=`$(dirname $(dirname $(readlink -f $(which javac))))`
        ;;
esac

export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=/usr/texbin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.dotfiles/scripts:$PATH

export EDITOR="vim"
export PAGER=less

export MUTT_REALNAME="Matteo Muscella"
export MUTT_EMAIL_ADDRESS="matteo.muscella@gmail.com"

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export TEXMFDIR="$HOME/.texmf"

export USER="$(hostname)"

# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

