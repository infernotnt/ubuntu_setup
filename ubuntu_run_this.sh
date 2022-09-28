#!/bin/bash

if [[ $EUID > 0 ]]
then echo "Please run as root (or just use sudo)."
	exit
fi

sudo apt update -y ; sudo apt upgrade -y


sudo apt install -y neovim vim tldr ripgrep fzf htop youtube-dl cmatrix translate-shell

# drawing - paint for linux
sudo apt install -y qbittorrent vlc drawing

sudo apt install -y gnome-tweaks gnome-extensions-app

sudo apt install -y build-essential

# Pc-specific
sudo apt install -y radeontop

# install flatpaks
sudo apt install -y flatpak

# enables the Software to see Flatpaks
sudo apt install -y gnome-software-plugin-flatpak

# some software that can't be put in the installation for legal reasons (probably for things like playing .mp3 files, idk)
sudo apt install -y ubuntu-restricted-extras

# add flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


# Install Brave Browser =========
sudo apt install -y apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update -y

sudo apt install -y brave-browser
# ===============================

# Large
# sudo apt install -y wine
# sudo apt install -y jupyter

# sudo apt autoremove? idk

sudo ./general.sh
