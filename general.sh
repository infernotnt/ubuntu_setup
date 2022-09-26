#!/bin/bash

if ! [ -z "$SUDO_USER" ]
then
	USERNAME=$SUDO_USER
fi

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

printf "::Copying the .config directory\n"
cp -rv backup/.config/*                 $USER_HOME/.config/
printf "\n\n\n\n"


printf "::Copying the .scripts directory\n"
cp -rv backup/.scripts/*                $USER_HOME/.scripts
printf "\n\n\n\n"

printf "::Copying the .inputrc file\n"
cp -v backup/.inputrc                   $USER_HOME/.inputrc

printf "::Copying the .bashrc file\n"
cp -v backup/.bashrc                    $USER_HOME/.bashrc

printf "::Copying the .bash_profile file\n"
cp -v backup/.bash_profile                   $USER_HOME/.bash_profile

# Set brave browser as the default pdf viewer
xdg-mime default brave-browser.desktop application/pdf

rm -r $USER_HOME/Public $USER_HOME/Documents $USER_HOME/Videos $USER_HOME/Music

# Set correct permissions
printf "::Setting permissions\n"
chown -R $USERNAME $USER_HOME/*

# Make sure all the files are owned by the local user and not by the root account
printf "::Setting file and directory ownage\n"
chown -R $USERNAME $USER_HOME/
