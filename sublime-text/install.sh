#!/bin/zsh

PACKAGES="$HOME/Library/Application Support/Sublime Text 3/Packages"

# Make directories, if necessary
mkdir -p "$PACKAGES"

cd "$PACKAGES"
if [ ! -d "$PACKAGES"/Base2Tone-sublime-text ]; then
  git clone https://github.com/atelierbram/Base2Tone-sublime-text.git
fi

SUBLIME_PREFERENCES="$PACKAGES/User/Preferences.sublime-settings"
if [ ! -f "$SUBLIME_PREFRENCES" ]; then
  mkdir "$PACKAGES/User"
  touch "$SUBLIME_PREFERENCES"
fi
ln -sf "$HOME"/dotfiles/sublime-text/Preferences.sublime-settings "$SUBLIME_PREFERENCES"
