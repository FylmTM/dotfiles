#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

echo "Dump Guake..."
dconf dump /apps/guake/ > $DOTFILES/system/guake_configuration

echo "Copy xfce4 configuration files"
cp -f $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/keyboard-layout.xml $DOTFILES/system/xfce4/xfconf/xfce-perchannel-xml/keyboard-layout.xml
cp -f $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml $DOTFILES/system/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
cp -f $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml $DOTFILES/system/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
cp -f $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml $DOTFILES/system/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml

