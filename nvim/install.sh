#!/bin/zsh

if [ ! -d $HOME/.config/nvim/ ]; then
  mkdir "$HOME/.config/nvim"
fi

ln -sf "$HOME"/dotfiles/nvim/init.lua "$HOME"/.config/nvim/init.lua
echo "Linked init.lua"


if [ ! -d $HOME/.config/nvim/lua ]; then
  mkdir "$HOME/.config/nvim/lua"
fi

LUA_FILES="
 keys
 opts
 vars
"

for lua_file in $LUA_FILES; do
  ln -sf "$HOME/dotfiles/nvim/lua/$lua_file.lua" "$HOME/.config/nvim/lua/$lua_file.lua"
  echo "Linked $lua_file.lua"
done


if [ ! -d $HOME/.config/nvim/lua/custom ]; then
  mkdir "$HOME/.config/nvim/lua/custom"
fi

CUSTOM_FILES="
  airline
  oceanic-next
  plugins
  nvim-treesitter
"

for custom_file in $CUSTOM_FILES; do
  ln -sf "$HOME/dotfiles/nvim/lua/custom/$custom_file.lua" "$HOME/.config/nvim/lua/custom/$custom_file.lua"
  echo "Linked custom/$custom_file.lua"
done
