#!/usr/bin/env bash

rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
#
# git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
#
cd $HOME

paru -S carapace-bin

flatpak install flathub $([[ "${varInstallBraveBrowser^^}" == "Y" ]] && echo "com.brave.Browser") \
    $(echo "it.mijorus.smile")

sudo ln -fvs /var/lib/flatpak/exports/bin/com.brave.Browser /usr/bin/brave

systemctl --user enable syncthing.service
systemctl --user start syncthing.service

##### END USER CHOICES #####

sudo ln -fvs ~/.dotfiles/assets/breeze_cursors /usr/share/icons/

/usr/bin/zoxide init nushell >~/.zoxide.nu

cd $HOME

chsh -s /usr/bin/zsh

bash $HOME/.dotfiles/stow.sh
