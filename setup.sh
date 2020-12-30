#!/bin/zsh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
echo "› brew bundle"
brew bundle

# Install oh-my-zsh
export ZSH="/Users/madelinewu/.oh-my-zsh"

if [ ! -d $ZSH ]; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Set up git
prompt_for_git_config () {
    option=$1
    prompt="$2"

    if [[ ! `git config --global $option` ]]; then
        read -p "$prompt: " item
        git config --global $option "$item"
    fi
}

configure_git () {
    prompt_for_git_config user.name "Enter your name"
    prompt_for_git_config user.email "Enter your email"

    git config --global core.excludesfile "$HOME/.gitignore_global"
}

echo "Configuring git..."
configure_git
