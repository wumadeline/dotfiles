if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:${PATH}"
fi

export PATH="${HOME}/bin:${PATH}"

ZSH_DISABLE_COMPFIX="true"

DOTFILES=(
  .alias
  dotfiles/.forethought/.config
)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

export BAT_THEME='Solarized (dark)'

# Enable tab completion for Poetry
# https://python-poetry.org/docs/#enable-tab-completion-for-bash-fish-or-zsh
if [ ! -d $ZSH_CUSTOM/plugins/poetry ]; then
  mkdir $ZSH_CUSTOM/plugins/poetry
  poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    autopep8
    docker
    docker-compose
    fzf
    git
    poetry
    pyenv
    sublime
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

# Use pyenv version of Python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
