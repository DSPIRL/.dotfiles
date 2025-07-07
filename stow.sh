#!/usr/bin/env bash

cd $HOME/.dotfiles

rm -rf ~/.config/alacritty \
    ~/.config/ghostty \
    ~/.config/hypr \
    ~/.config/kanata \
    ~/.config/nushell \
    ~/.config/nvim \
    ~/.config/starship.toml \
    ~/.config/tmux \
    ~/.config/wezterm \
    ~/.ideavimrc \
    ~/.profile \
    ~/.vimrc \
    ~/.zshenv \
    ~/.zshrc \
    ~/.tmux \
    ~/.bashrc \
    ~/.bash_profile \
    ~/.bash_history \
    ~/.bash_logout

stow .
