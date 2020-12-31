# dotfiles
These are my (WIP) dotfiles.

## Installation
### Set Up
Clone a copy of this directory onto your local machine.
```
git clone https://github.com/wumadeline/dotfiles.git
cd dotfiles
```

On a new machine, install the most recent software update and set up all
necessary dependencies/applications.
```
sudo softwareupdate -i -a
xcode-select --install
sh setup

```

### Mac OS X Preferences
Set default macOS system preferences:
```
source .macos
```

### Installation
The dotfiles come packaged with a bootstrap installation script. This script
will link the relevant dotfiles from this repo to your home directory, so they
can be sourced by the `.zshrc` file. This script also links the relevant
application profiles/preferences by looking for all of the `install.sh` scripts
within the dotfiles repo.

```
sh install
```
After this runs successfully, restart your terminal and your dotfiles should
take affect. `zsh` automatically sources `.zshrc` upon initialization, so there
is no need to manually source this after changes are made.

## Customizing iTerm Appearance
### Using Powerline fonts
You'll need to install Powerline fonts in order for some of the `oh-my-zsh`
themes to render properly.
```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install fonts
cd fonts
./install.sh
# clean up the fonts dir, now that they've been installed
cd ..
rm -rf fonts
```

Them, you can change the iTerm2 text to use the `Meslo LG M DZ for Powerline`
font.
```
iTerm2 > Preferences > Profiles > Text > Font > Meslo LG M DZ for Powerline
```

### Solarized Dark theme
Change the iTerm2 colors via the Preferences:
```
iTerm2 > Preferences >  Profiles > Colors > Color Presets > Solarized Dark
```

## Credits
### Dotfiles Referenced
[caarlos0](https://github.com/caarlos0/dotfiles)

[driesvints](https://github.com/driesvints/dotfiles)

[jcomo](https://github.com/jcomo/dotfiles)

[mathiasbynens](https://github.com/mathiasbynens/dotfiles)

[webpro](https://github.com/webpro/dotfiles)

### Useful Resources
[Getting Started with Dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles/) by Dries Vints

[Getting Started with
Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
by Lars Kappert

[Setting Up a Mac Dev Machine From Zero to Hero with Dotfiles](https://github.com/herrbischoff/awesome-macos-command-line)

A repo
([awesome-macos-command-line](https://github.com/herrbischoff/awesome-macos-command-line))
detailing shells commands to customize macOS
[Setting up Neovim for Web Development in 2020](https://medium.com/better-programming/setting-up-neovim-for-web-development-in-2020-d800de3efacd) by Dominik Tarnowski

[A Complete Guide to Neovim Configuration for Python Development on
Linux](https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/) by
jdhao
