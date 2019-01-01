#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

function updateSystemConfigs() {
    echo "Updating system configs..."

    echo "Generate locales"
    sudo sed -i '/#en_US.UTF-8 UTF-8/s/^# *//' /etc/locale.gen
    sudo sed -i '/#en_DK.UTF-8 UTF-8/s/^# *//' /etc/locale.gen

    sudo locale-gen

    echo "Copy configs..."
    sudo cp -frTv "$DOTFILES/etc/" /etc

    echo "System configs updated."
}

echo "Begin system configuration..."
echo

echo "Enter sudo password..."
sudo echo "Thanks!"

updateSystemConfigs
echo

echo "System configuration finished."

