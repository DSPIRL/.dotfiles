#!/usr/bin/env bash

operatingSystem=$(grep -i "PRETTY_NAME" </etc/os-release | awk -F'"' '{print $2}')
chassis=$(hostnamectl chassis)

if [[ "$operatingSystem" == "Arch Linux" ]]; then
    sudo pacman -S $(awk -v RS= '{$1=$1}1' ~/.dotfiles/archPackages.txt)

    ##### USER CHOICES #####
    read -rp 'Do you want to install DevTooling? (Y/N): ' varInstallDevtools
    read -rp 'Would you like to install the yay AUR helper? (Y/N): ' varInstallYay
    if [[ "$varInstallYay" == "Y" || "$varInstallYay" == "y" ]]; then
        read -rp 'Do you want to install Carapace completers? (Y/N): ' varInstallCarapace
    fi
    read -rp 'Do you want to install Brave Browser? (Y/N): ' varInstallBraveBrowser
    read -rp 'Do you want to install Varia Download Manager? (Y/N): ' varInstallVaria
    read -rp 'Do you want to install Deluge bit-torrent manager? (Y/N): ' varInstallDeluge
    read -rp 'Do you want to install TMUX? (Y/N): ' varInstallTmux
    read -rp 'Do you want to install and setup Syncthing? (Y/N): ' varInstallSyncthing
    read -rp 'Do you want to install Wireguard? (Y/N): ' varInstallWireguard
    read -rp 'Do you want to setup virtual machines? (Y/N): ' varArchVM
    read -rp 'Would you like to install kanata for custom keyboard layouts? (Y/N): ' varInstallKanata
    read -rp 'Do you want to install oh-my-zsh? (Y/N): ' varInstallOMZ
    read -rp 'Run stow automatically? WARNING: This will overwrite conflicting files already on your machine. (Y/N): ' varRunStow

    if [[ "$varInstallDevtools" == "Y" || "$varInstallDevtools" == "y" ]]; then
        sudo pacman -S $(awk -v RS= '{$1=$1}1' ~/.dotfiles/archDevPackages.txt)
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi

    if [[ "$varInstallSyncthing" == "Y" || "$varInstallSyncthing" == "y" ]]; then
        sudo pacman -S syncthing
        systemctl --user enable syncthing.service
        systemctl --user start syncthing.service
    fi

    if [[ "$varInstallTmux" == "Y" || "$varInstallTmux" == "y" ]]; then
        sudo pacman -S tmux
    fi

    if [[ "$varInstallWireguard" == "Y" || "$varInstallWireguard" == "y" ]]; then
        sudo pacman -S wireguard-tools
    fi

    if [[ "$varArchVM" == "Y" || "$varArchVM" == "y" ]]; then
        sudo pacman -S $(awk -v RS= '{$1=$1}1' ~/.dotfiles/archVMPackages.txt)
    fi

    if [[ "$varRunStow" == "Y" || "$varRunStow" == "y" ]]; then
        rm -rf ~/.config/alacritty ~/.config/ghostty ~/.config/hypr ~/.config/kanata ~/.config/nushell ~/.config/nvim ~/.config/starship.toml ~/.config/tmux ~/.config/wezterm ~/.ideavimrc ~/.profile ~/.vimrc ~/.zshenv ~/.zshrc
        stow .
    fi

    if [[ "$varInstallTmux" == "Y" || "$varInstallTmux" == "y" ]]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    # ohmyzsh
    if [[ "$varInstallOMZ" == "Y" || "$varInstallOMZ" == "y" ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        rm ~/.zshrc
    fi

    if [[ "$varRunStow" == "Y" || "$varRunStow" == "y" ]]; then
        stow .
    fi

    if [[ "$varInstallYay" == "Y" || "$varInstallYay" == "y" ]]; then
        sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
        yay -S carapace-bin
    fi

    if [[ "$varInstallBraveBrowser" == "Y" || "$varInstallBraveBrowser" == "y" ]]; then
        flatpak install flathub com.brave.Browser
        sudo ln -fvs /var/lib/flatpak/exports/bin/com.brave.Browser /usr/bin/brave
    fi

    if [[ "$varInstallVaria" == "Y" || "$varInstallVaria" == "y" ]]; then
        flatpak install flathub io.github.giantpinkrobots.varia
        sudo ln -fvs /var/lib/flatpak/exports/bin/io.github.giantpinkrobots.varia /usr/bin/varia
    fi

    if [[ "$varInstallDeluge" == "Y" || "$varInstallDeluge" == "y" ]]; then
        sudo pacman -S deluge deluge-gtk
    fi

    if [[ "$varInstallKanata" == "Y" || "$varInstallKanata" == "y" ]]; then
        $HOME/.cargo/bin/cargo install kanata
    fi

    if [[ "$varArchVM" == "Y" || "$varArchVM" == "y" ]]; then
        echo "Please review \"archVirtualizationInstruction.md\" to complete setup."
    fi
    ##### END USER CHOICES #####

    ./usr/bin/zoxide init nushell >~/.zoxide.nu
    chsh -s /usr/bin/nu

elif [[ "$operatingSystem" == "Darwin" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install $(awk -v RS= '{$1=$1}1' ~/.dotfiles/brewPackages.txt)
else
    read -rp 'Are you on a Debian based disto? (Y/N): ' varDebian
    if [[ "$varDebian" == "Y" || "$varDebian" == "y" ]]; then
        sudo apt install $(awk -v RS= '{$1=$1}1' ~/.dotfiles/debianPackages.txt)
        chsh -s /usr/bin/zsh
    fi
fi
