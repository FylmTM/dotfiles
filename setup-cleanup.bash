#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

function removePackages() {
    echo "Remove packages..."

    echo "Remove unnecessary pacman packages"
    cd $DOTFILES

    for P in $( <packages/pacman.remove.txt )
    do
        sudo pacman -Rs ${P} --noconfirm || true
    done

    echo "Packages removed."
}

echo "Begin system cleanup..."
echo

echo "Enter sudo password..."
sudo echo "Thanks!"

removePackages
echo

echo "User configuration finished."

