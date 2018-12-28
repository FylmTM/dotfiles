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

    echo "Configuration files linked."
}



echo "Begin system configuration..."
echo

linkConfigurationFiles
echo

echo "System configuration finished."

