#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

function linkUserConfigs() {
    echo "Link configuration files..."
    cp -frTvs "$DOTFILES/home/" $HOME

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

    echo "Copy xfce4 configurations"
    cp -frTv "$DOTFILES/system/xfce4/" $HOME/.config/xfce4

    echo "Configure autostart"
    sudo cp /usr/share/applications/albert.desktop /etc/xdg/autostart/

    echo "Configuration files copied."
}

function installPackages() {
    echo "Install packages..."

    echo "Install pacman packages"
    cd $DOTFILES
    sudo pacman --noconfirm -S --needed `cat packages/pacman.txt`

    echo "Install pip3 packages"
    for pipPackage in $(cat ./packages/pip.txt); do
        sudo pip3 install $pipPackage
    done

    echo "Install aur packages"
    cd $DOTFILES
    yay --pgpfetch --needed --noconfirm -S `cat packages/aur.txt`

    echo "Packages installed."
}

echo "Begin user configuration..."
echo

echo "Enter sudo password..."
sudo echo "Thanks!"

installPackages
echo

linkUserConfigs
echo

echo "User configuration finished."

