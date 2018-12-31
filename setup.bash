#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

function linkConfigurationFiles() {
    echo "Link configuration files..."

    cd $DOTFILES/home
    for file in $(find . -type f -printf '%P\n'); do
        SOURCE=$DOTFILES/home/$file
        TARGET=$HOME/$file
        echo "Linking $TARGET"
        rm -f $TARGET
        ln -fs $SOURCE $TARGET
    done

    cd $DOTFILES
    NAME="Dmitry Vrublevsky"
    EMAIL="dmitry@vrublevsky.me"
    if [ -f .name ]; then
        NAME=$(cat ./.name)
    fi
    if [ -f .email ]; then
        EMAIL=$(cat ./.email)
    fi
    cat templates/.gitconfig | sed "s/NAME/$NAME/" | sed "s/EMAIL/$EMAIL/" > $HOME/.gitconfig
    echo "Configuring ~/.gitconfig with $NAME <$EMAIL>"

    echo "Configuration files linked."
}

function installPackages() {
    echo "Install packages..."

    cd $DOTFILES
    sudo pacman --noconfirm -S --needed `cat packages/pacman.txt`

    echo "Packages installed."
}

echo "Begin system configuration..."
echo

linkConfigurationFiles
echo

installPackages
echo

echo "System configuration finished."

