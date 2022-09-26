#!/bin/bash

USER_HOME=/home/$USERNAME

# Neovim plugins, currently probably doesn't work
# Download vim-plug
sudo -u $USERNAME curl -fLo "${XDG_DATA_HOME:-$USER_HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install plugins with vim-plug (:PlugInstall)
sudo -u $USERNAME nvim --headless +PlugInstall +qall

#------------------------

mkdir /mnt/sda1 ; mkdir /mnt/sda2 ; mkdir /mnt/sda3 ; mkdir /mnt/sda4
mkdir /mnt/sdb1 ; mkdir /mnt/sdb2 ; mkdir /mnt/sdb3 ; mkdir /mnt/sdb4
mkdir /mnt/sdc1 ; mkdir /mnt/sdc2 ; mkdir /mnt/sdc3 ; mkdir /mnt/sdc4
mkdir /mnt/sdd1 ; mkdir /mnt/sdd2 ; mkdir /mnt/sdd3 ; mkdir /mnt/sdd4

mkdir -v    $USER_HOME/.config
mkdir -v    $USER_HOME/.scripts

mkdir -pv   $USER_HOME/.cache/temp_my_ms

cp -rv backup/.config/*                 $USER_HOME/.config/
cp -rv backup/.scripts/*                $USER_HOME/.scripts
cp -rv backup/.local/share/fonts/*      $USER_HOME/.local/share/fonts/

cp -v backup/.inputrc                   $USER_HOME/.inputrc

# Set brave browser as the default pdf viewer
xdg-mime default brave-browser.desktop application/pdf

rm -r $USER_HOME/Public $USER_HOME/Documents $USER_HOME/Videos $USER_HOME/Music

# Set correct permissions
chown -Rv $USERNAME $USER_HOME/*

# Make sure all the files are owned by the local user and not by the root account
chown -Rv $USERNAME $USER_HOME/
