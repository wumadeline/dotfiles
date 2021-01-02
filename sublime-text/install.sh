#!/bin/zsh

PACKAGES="$HOME/Library/Application Support/Sublime Text 3/Packages/"

cd "$PACKAGES"
if [ ! -d "$PACKAGES"/Base2Tone-sublime-text ]; then
  git clone https://github.com/atelierbram/Base2Tone-sublime-text.git
fi

ln -sf "$HOME"/dotfiles/sublime-text/Preferences.sublime-settings "$HOME"/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
