#!/bin/sh

# Exit on error
set -e

DOTFILES="
 .gitconfig
 .zshrc
"

success () {
    echo "\033[32m[OK]   \033[0m $1"
}

warn () {
    echo "\033[33m[WARN] \033[0m $1"
}

info () {
    echo "\033[36m[INFO] \033[0m $1"
}

silence () {
    if [[ $DEBUG = 1 ]]; then
        "$@"
    else
        "$@" &>/dev/null
    fi
}

confirm () {
    message="$1"
    read -p "$1 Continue? [yN] " response

    if [[ "y" != $response ]]; then
        info "Exiting..."
        exit 1
    fi
}

link_dotfiles () {
    for dotfile in $DOTFILES; do
        silence ln -sf "$HOME/dotfiles/$dotfile" "$HOME" || warn "Failed to link $dotfile" && \
            info "Linked $dotfile"
    done
}

main () {
    confirm "Running this installation will wipe all previous dotfiles."
    info "Linking dotfiles"; link_dotfiles
    success "Dotfiles installed!"
    source ~/.zshrc
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    if [[ "debug" = $1 ]]; then
        DEBUG=1
    else
        DEBUG=0
    fi

    main "$@"
fi
