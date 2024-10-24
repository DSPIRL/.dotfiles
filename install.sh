#!/usr/bin/env bash

##### PREQEQUISITES #####
# zsh
# neovim
# curl
# git
# eza


# Determine OS
hostOS=$(uname -s)
macOS="Darwin"
linux="Linux"
processorType=$(uname -p)


# Nix install
if [[ $hostOS = $macOS ]]; then
    sh <(curl -L https://nixos.org/nix/install)
elif [[ $hostOS = $linux ]]; then
    sh <(curl -L https://nixos.org/nix/install) --daemon
fi

# Nix symlink and package install
ln -fvs ~/.dotfiles/config/nix/ ~/.config/nix
bash -l -c "nix search nixpkgs neovim"
bash -l -c "nix-env -iA $(cat ~/.dotfiles/config/nix/packages.txt)"


# Brew install
if [[ $hostOS = $macOS ]] ||  ([[ $hostOS = $linux ]] && [[ processorType = "x86_64" ]]); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
    

# # Oh My Zsh install
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
#
# # Zoxide
# curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
#
#
# # Starship install
# curl -sS https://starship.rs/install.sh | sh
#
#
# # FZF install
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install


##### Set up symlinks #####
# Dotfiles
ln -fvs ~/.dotfiles/shell/.zshrc ~/.zshrc
ln -fvs ~/.dotfiles/shell/.zshenv ~/.zshenv
ln -fvs ~/.dotfiles/shell/.tmux.conf ~/.tmux.conf
ln -fvs ~/.dotfiles/shell/.vimrc ~/.vimrc
ln -fvs ~/.dotfiles/shell/.ideavimrc ~/.ideavimrc
ln -fvs ~/.dotfiles/config/starship.toml ~/.config/starship.toml 
ln -fvs ~/.dotfiles/config/alacritty/ ~/.config/
ln -fvs ~/.dotfiles/config/wezterm/ ~/.config/wezterm


# Change default shell and switch
chsh -s /usr/bin/zsh; zsh


# Zoxide init
zoxide init


# Brew installs
if [[ $hostOS = $macOS ]]; then
    brew install eza zsh-autosuggestions zsh-syntax-highlighting neovim gh
fi


# NvChad install and configuration
if [[ $hostOS = $macOS ]] || ([[ $hostOS = $linux ]] && [[ processorType != "arm" ]]); then
    git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
fi


ln -fvs ~/.dotfiles/config/nvim/lua/options.lua ~/.config/nvim/lua/options.lua 
ln -fvs ~/.dotfiles/config/nvim/lua/chadrc.lua ~/.config/nvim/lua/chadrc.lua
ln -fvs ~/.dotfiles/config/nvim/lua/plugins/init.lua ~/.config/nvim/lua/plugins/init.lua
