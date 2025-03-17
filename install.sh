#!/usr/bin/env bash

operatingSystem=$(grep -i "PRETTY_NAME" </etc/os-release | awk -F'"' '{print $2}')
chassis=$(hostnamectl chassis)

if [[ "$operatingSystem" == "Arch Linux" ]]; then
    sudo pacman -S $(awk -v RS= '{$1=$1}1' archPackages.txt)
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Install YAY
    if [[ "$chassis" == "laptop" ]]; then
        read -rp 'Would you like to install kanata? (Y/N): ' varInstallKanata
        if [[ "$varInstallKanata" == "Y" || "$varInstallKanata" == "y" ]]; then
            sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
            cargo install kanata
        fi
    else
        read -rp 'Would you like to install the yay AUR helper? (Y/N): ' varInstallYay
        if [[ "$varInstallYay" == "Y" || "$varInstallYay" == "y" ]]; then
            sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
        fi
    fi

    read -rp 'Do you want to setup virtual machines? (Y/N): ' varArchVM
    if [[ "$varArchVM" == "Y" || "$varArchVM" == "y" ]]; then
        sudo pacman -S $(awk -v RS= '{$1=$1}1' archVMPackages.txt)
    fi

elif [[ "$operatingSystem" == "Darwin" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install $(awk -v RS= '{$1=$1}1' brewPackages.txt)
else
    read -rp 'Are you on a Debian based disto? (Y/N): ' varDebian
    if [[ "$varDebian" == "Y" || "$varDebian" == "y" ]]; then
        sudo apt install $(awk -v RS= '{$1=$1}1' debianPackages.txt)
    fi
fi

chsh -s /usr/bin/zsh
