#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

rsync
    --exclude ".git/" \
    --exclude ".DS_STORE" \
    --exclude ".macos" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    -avh --no-perms . ~;

source ~/.bash_profile;
