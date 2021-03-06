if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:${PATH}"
fi

ZSH_DISABLE_COMPFIX="true"

DOTFILES=(
  .alias
)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

export BAT_THEME='base2tone-earth.dark'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Also add zsh-poetry: https://github.com/darvid/zsh-poetry
plugins=(
    autopep8
    docker
    docker-compose
    fzf
    git
    poetry
    sublime
    thefuck
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Load default dotfiles
for DOTFILE in $DOTFILES; do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done
