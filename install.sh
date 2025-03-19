#!/usr/bin/env bash

operatingSystem=$(grep -i "PRETTY_NAME" </etc/os-release | awk -F'"' '{print $2}')
chassis=$(hostnamectl chassis)

if [[ "$operatingSystem" == "Arch Linux" ]]; then
    sudo pacman -S $(awk -v RS= '{$1=$1}1' ~/.dotfiles/archPackages.txt)
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # Install YAY
    if [[ "$chassis" == "laptop" ]]; then
        read -rp 'Would you like to install kanata for custom keyboard layouts? (Y/N): ' varInstallKanata
        if [[ "$varInstallKanata" == "Y" || "$varInstallKanata" == "y" ]]; then
            sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
            cargo install kanata
        fi
    else
        read -rp 'Would you like to install the yay AUR helper? (Y/N): ' varInstallYay
        if [[ "$varInstallYay" == "Y" || "$varInstallYay" == "y" ]]; then
            sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
            yay -S carapace-bin
        fi
    fi

    ##### USER CHOICES #####
    read -rp 'Do you want to install TMUX? (Y/N): ' varInstallTmux
    if [[ "$varInstallTmux" == "Y" || "$varInstallTmux" == "y" ]]; then
        sudo pacman -S tmux
    fi

    read -rp 'Do you want to install DevTooling? (Y/N): ' varInstallDevtools
    if [[ "$varInstallDevtools" == "Y" || "$varInstallDevtools" == "y" ]]; then
        sudo pacman -S $(awk -v RS= '{$1=$1}1' ~/.dotfiles/archDevPackages.txt)
    fi

    read -rp 'Do you want to install Wireguard? (Y/N): ' varInstallWireguard
    if [[ "$varInstallWireguard" == "Y" || "$varInstallWireguard" == "y" ]]; then
        sudo pacman -S wireguard-tools
    fi

    read -rp 'Do you want to install and setup Syncthing? (Y/N): ' varInstallSyncthing
    if [[ "$varInstallSyncthing" == "Y" || "$varInstallSyncthing" == "y" ]]; then
        sudo pacman -S syncthing
        systemctl --user enable syncthing.service
        systemctl --user start syncthing.service
    fi

    read -rp 'Do you want to setup virtual machines? (Y/N): ' varArchVM
    if [[ "$varArchVM" == "Y" || "$varArchVM" == "y" ]]; then
        sudo pacman -S $(awk -v RS= '{$1=$1}1' ~/.dotfiles/archVMPackages.txt)
        echo "Please review \"archVirtualizationInstruction.md\" to complete setup."
    fi

    # ohmyzsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    read -rp 'Run stow automatically? WARNING: This will overwrite conflicting already on your machine. (Y/N): ' varRunStow
    if [[ "$varRunStow" == "Y" || "$varRunStow" == "y" ]]; then
        rm -rf ~/.config/alacritty ~/.config/ghostty ~/.config/hypr ~/.config/kanata ~/.config/nushell ~/.config/nvim ~/.config/starship.toml ~/.config/tmux ~/.config/wezterm ~/.ideavimrc ~/.profile ~/.vimrc ~/.zshenv ~/.zshrc
        stow .
    fi
    ##### END USER CHOICES #####

elif [[ "$operatingSystem" == "Darwin" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install $(awk -v RS= '{$1=$1}1' ~/.dotfiles/brewPackages.txt)
else
    read -rp 'Are you on a Debian based disto? (Y/N): ' varDebian
    if [[ "$varDebian" == "Y" || "$varDebian" == "y" ]]; then
        sudo apt install $(awk -v RS= '{$1=$1}1' ~/.dotfiles/debianPackages.txt)
    fi
fi

chsh -s /usr/bin/zsh
