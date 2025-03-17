#!/usr/bin/env bash

operatingSystem=$(grep -i "PRETTY_NAME" </etc/os-release | awk -F'"' '{print $2}')
chassis=$(hostnamectl chassis)
pacmanPackages=$(awk -v RS= '{$1=$1}1' pacmanPackages.txt)
brewPackages=$(awk -v RS= '{$1=$1}1' brewPackages.txt)

if [[ "$operatingSystem" == "Arch Linux" ]]; then
    sudo pacman -S $pacmanPackages
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
elif [[ "$operatingSystem" == "Darwin" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install $brewPackages
fi

chsh -s /usr/bin/zsh
