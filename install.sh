#!/usr/bin/env bash

operatingSystem=$(grep -i "PRETTY_NAME" </etc/os-release | awk -F'"' '{print $2}')
chassis=$(hostnamectl chassis)
pacmanPackages=$(cat ~/.dotfiles/pacmanPackages.txt)

if [[ "$operatingSystem" == "Arch Linux" ]]; then
    sudo pacman -S $(echo $pacmanPackages)
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    cargo install kanata

    # Install YAY
    if [[ "$chassis" == "laptop" ]]; then
        sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    else
        read -rp 'Would you like to install the yay AUR helper? (Y/N): ' varInstallYay
        if [[ "$varInstallYay" == "Y" || "$varInstallYay" == "y" ]]; then
            sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
        fi
    fi
fi

chsh -s /usr/bin/zsh
