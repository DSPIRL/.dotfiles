#!/usr/bin/env bash

paru -S $(awk -v RS= '{$1=$1}1' ~/.dotfiles/package_lists/archPackages.txt) \
    $(awk -v RS= '{$1=$1}1' ~/.dotfiles/package_lists/archHyprlandPackages.txt) \
    $(awk -v RS= '{$1=$1}1' ~/.dotfiles/package_lists/archDevPackages.txt) \
    $(echo "syncthing")
