#!/usr/bin/env bash

operatingSystem=$(grep -i "PRETTY_NAME" </etc/os-release | awk -F'"' '{print $2}')
chassis=$(hostnamectl chassis)

if [[ "$operatingSystem" == "Arch Linux" ]]; then
    ##### USER CHOICES #####
    echo ""
    echo '##### SYSTEM SETUP #####'
    read -rp 'Do you want to install sensible default packages? (Y/N): ' varInstallDefaults
    read -rp 'Do you want to install and setup Hyprland? (Y/N): ' varInstallHyprland
    read -rp 'Do you want to install DevTooling? (Y/N): ' varInstallDevtools
    read -rp 'Would you like to install kanata for custom keyboard layouts? (Y/N): ' varInstallKanata
    read -rp 'Run stow automatically? WARNING: This will overwrite conflicting dotfiles already on your machine. (Y/N): ' varRunStow
    if [[ "${chassis}" == "laptop" ]]; then
        read -rp 'Do you want to install TLP for power management? (Y/N): ' varInstallTLP
    fi

    echo ""
    echo '##### APPLICATIONS #####'
    read -rp 'Do you want to install Brave Browser? (Y/N): ' varInstallBraveBrowser
    read -rp 'Do you want to install Varia Download Manager? (Y/N): ' varInstallVaria
    read -rp 'Do you want to install Deluge bit-torrent manager? (Y/N): ' varInstallDeluge
    read -rp 'Do you want to install and setup Syncthing? (Y/N): ' varInstallSyncthing
    read -rp 'Do you want to install LazyVim? (Y/N): ' varInstallLazyVim
    read -rp 'Do you want to install Wireguard? (Y/N): ' varInstallWireguard
    read -rp 'Do you want to install and setup Virtual Machines? (Y/N): ' varArchVM

    echo ""
    echo '##### SHELL CONFIG #####'
    read -rp 'Do you want to install oh-my-zsh? (Y/N): ' varInstallOMZ
    read -rp 'Do you want ZSH or Nushell as your default shell? (Z/N): ' varDefaultShell

    if [[ "${varInstallOMZ^^}" == "Y" ]]; then
        echo "
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
WHEN YOU GET TO THE OH-MY-ZSH INSTALL AND IT ASKS IF YOU WANT TO SET ZSH AS THE DEFAULT SHELL, ANSWER NO AND THEN TYPE \"exit\" TO CONTINUE THIS INSTALLATION
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
"
    fi

    read -rp 'Would you like to install the yay AUR helper? (Y/N): ' varInstallYay
    if [[ "${varInstallYay^^}" == "Y" ]]; then
        read -rp 'Do you want to install Carapace completers? (Y/N): ' varInstallCarapace
    fi
    read -rp 'Do you want to install TMUX? (Y/N): ' varInstallTmux

    sudo pacman -S $([[ ${varInstallDefaults^^} == "Y" ]] && awk -v RS= '{$1=$1}1' ~/.dotfiles/package_lists/archPackages.txt) \
        $([[ ${varInstallHyprland^^} == "Y" ]] && awk -v RS= '{$1=$1}1' ~/.dotfiles/package_lists/archHyprlandPackages.txt) \
        $([[ ${varInstallDevtools^^} == "Y" ]] && awk -v RS= '{$1=$1}1' ~/.dotfiles/package_lists/archDevPackages.txt) \
        $([[ "${varInstallSyncthing^^}" == "Y" ]] && echo syncthing) \
        $([[ ${varInstallTmux^^} == "Y" ]] && echo tmux) \
        $([[ ${varInstallWireguard^^} == "Y" ]] && echo wireguard-tools) \
        $([[ ${varArchVM^^} == "Y" ]] && awk -v RS= '{$1=$1}1' ~/.dotfiles/package_lists/archVMPackages.txt) \
        $([[ ${varInstallDeluge^^} == "Y" ]] && echo "deluge deluge-gtk") \
        $([[ ${varInstallYay^^} == "Y" ]] && echo "go") \
        $([[ ${chassis} == "laptop" && ${varInstallTLP^^} == "Y" ]] && echo "tlp")

    if [[ "${varInstallKanata^^}" == "Y" ]]; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi

    if [[ "${varInstallDevtools^^}" == "Y" ]]; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi

    if [[ "${varInstallSyncthing^^}" == "Y" ]]; then
        systemctl --user enable syncthing.service
        systemctl --user start syncthing.service
    fi

    # ohmyzsh
    if [[ "${varInstallOMZ^^}" == "Y" ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    if [[ "${varInstallLazyVim^^}" == "Y" ]]; then
        rm -rf ~/.config/nvim
        rm -rf ~/.local/state/nvim
        rm -rf ~/.local/share/nvim

        git clone https://github.com/LazyVim/starter ~/.config/nvim
        rm -rf ~/.config/nvim/.git
    fi

    if [[ "${varRunStow^^}" == "Y" ]]; then
        rm -rf ~/.config/alacritty ~/.config/ghostty ~/.config/hypr ~/.config/kanata ~/.config/nushell ~/.config/nvim ~/.config/starship.toml ~/.config/tmux ~/.config/wezterm ~/.ideavimrc ~/.profile ~/.vimrc ~/.zshenv ~/.zshrc ~/.tmux
        stow .
    fi

    if [[ "${varInstallTmux^^}" == "Y" ]]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    if [[ "${varInstallYay^^}" == "Y" ]]; then
        cd $HOME
        sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    fi

    if [[ "${varInstallCarapace^^}" == "Y" ]]; then
        yay -S carapace-bin
    fi

    if [[ "${varInstallBraveBrowser^^}" == "Y" ]]; then
        flatpak install flathub com.brave.Browser
        sudo ln -fvs /var/lib/flatpak/exports/bin/com.brave.Browser /usr/bin/brave
    fi

    if [[ "${varInstallVaria^^}" == "Y" ]]; then
        flatpak install flathub io.github.giantpinkrobots.varia
        sudo ln -fvs /var/lib/flatpak/exports/bin/io.github.giantpinkrobots.varia /usr/bin/varia
    fi

    if [[ "${varInstallKanata^^}" == "Y" ]]; then
        $HOME/.cargo/bin/cargo install kanata
    fi

    ##### END USER CHOICES #####

    /usr/bin/zoxide init nushell >~/.zoxide.nu

    if [[ "${varDefaultShell^^}" == "Z" ]]; then
        chsh -s /usr/bin/zsh
    elif [[ "${varDefaultShell^^}" == "N" ]]; then
        chsh -s /usr/bin/nu
    fi

    if [[ "${varArchVM^^}" == "Y" ]]; then
        echo "Please review \"archVirtualizationInstruction.md\" to complete setup."
    fi

elif [[ "$operatingSystem" == "Darwin" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install $(awk -v RS= '{$1=$1}1' ~/.dotfiles/package_lists/macosPackages.txt)
else
    read -rp 'Are you on a Debian based disto? (Y/N): ' varDebian
    if [[ "${varDebian^^}" == "Y" ]]; then
        sudo apt install $(awk -v RS= '{$1=$1}1' ~/.dotfiles/package_lists/debianPackages.txt)
        chsh -s /usr/bin/zsh
    fi
fi
