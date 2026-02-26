#!/bin/zsh

# Directory setup
dotfiles_dir="$HOME/dotfiles/nvim"
config_dir="$HOME/.config/nvim/lua/custom"

# Custom plugin files
declare -a plugins=(
  "airline"
  "auto-pairs"
  "deoplete"
  "fzf-vim"
  "gitgutter"
  "lspconfig"
  "markdown-preview"
  "mason"
  "nerdcommenter"
  "nerdtree"
  "nerdtree-git-plugin"
  "noice"
  "nvim-treesitter"
  "obsidian"
  "trouble"
  "typescript-tools"
  "vim-diminactive"
  "vim-sensible"
  "which-key"
)

# Disable all plugins
rm -rf "$config_dir"/*
echo "Disabled all plugins."

# Always enable oceanic-next
ln -sf "$HOME/dotfiles/nvim/lua/custom/oceanic-next.lua" "$HOME/.config/nvim/lua/custom/oceanic-next.lua"


# Step-by-step enable plugins
for plugin in ${plugins[@]}; do
  ln -sf "$HOME/dotfiles/nvim/lua/custom/$plugin.lua" "$HOME/.config/nvim/lua/custom/$plugin.lua"
  echo "Enabled plugin: $plugin"

  # Prompt the user to test
  echo "Please test Neovim and press [Enter] when done testing (or type 'quit' to stop):"
  read input

  if [[ "$input" == "quit" ]]; then
    echo "Stopping plugin isolation process."
    exit 0
  fi

  # Remove the plugin before continuing to the next iteration
  rm "$HOME/.config/nvim/lua/custom/$plugin.lua"
done

# End of script
echo "All plugins tested."