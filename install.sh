#!/usr/bin/env bash

##### PREQEQUISITES #####
# zsh
# neovim
# curl
# git
# eza
# zsh-autosuggestions
# zsh-syntax-highlighting
# silicon
##### NUSHELL SETUP #####
# nushell
# carapace-bin (via yay AUR package manager)
#   Alaso need to make cache dir from carapace documentation
# zoxide init

# Determine OS
hostOS=$(uname -s)
macOS="Darwin"
linux="Linux"

# Brew install
if [[ "$hostOS" = "$macOS" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ "$hostOS" = "$linux" ]] || [[ "$hostOS" = "$macOS" ]]; then
  # Oh My Zsh install
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Zoxide
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  # Zoxide init
  zoxide init zsh

  # FZF install
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

# Starship install
curl -sS https://starship.rs/install.sh | sh

##### Set up symlinks #####
# Dotfiles
ln -fvs ~/.dotfiles/shell/.zshrc ~/.zshrc
ln -fvs ~/.dotfiles/shell/.zshenv ~/.zshenv
ln -fvs ~/.dotfiles/config/tmux/ ~/.config/tmux
ln -fvs ~/.dotfiles/shell/.vimrc ~/.vimrc
ln -fvs ~/.dotfiles/shell/.ideavimrc ~/.ideavimrc
ln -fvs ~/.dotfiles/config/starship.toml ~/.config/starship.toml
ln -fvs ~/.dotfiles/config/alacritty/ ~/.config/
ln -fvs ~/.dotfiles/config/wezterm/ ~/.config/wezterm
ln -fvs ~/.dotfiles/config/kanata/ ~/.config/kanata

# Change default shell and switch
chsh -s /usr/bin/zsh

# Brew installs
if [[ "$hostOS" = "$macOS" ]]; then
  brew install eza zsh-autosuggestions zsh-syntax-highlighting neovim gh
fi

ln -fvs ~/.dotfiles/config/nushell/ ~/.config/
ln -fvs ~/.dotfiles/config/nvim/lazyvim/lua/config/* ~/.config/nvim/lua/config/
ln -fvs ~/.dotfiles/config/nvim/lazyvim/lua/plugins/* ~/.config/nvim/lua/plugins/
ln -fvs ~/.dotfiles/config/nvim/lazyvim/stylua.toml ~/.config/nvim/stylua.toml

# ln -fvs ~/.dotfiles/config/nvim/lua/options.lua ~/.config/nvim/lua/options.lua
# ln -fvs ~/.dotfiles/config/nvim/lua/chadrc.lua ~/.config/nvim/lua/chadrc.lua
# ln -fvs ~/.dotfiles/config/nvim/lua/configs/conform.lua ~/.config/nvim/lua/configs/conform.lua
# ln -fvs ~/.dotfiles/config/nvim/lua/configs/nushell.lua ~/.config/nvim/lua/configs/nushell.lua
# ln -fvs ~/.dotfiles/config/nvim/lua/configs/lspconfig.lua ~/.config/nvim/lua/configs/lspconfig.lua
# ln -fvs ~/.dotfiles/config/nvim/lua/plugins/init.lua ~/.config/nvim/lua/plugins/init.lua
