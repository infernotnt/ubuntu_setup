#!/bin/bash

if [[ $EUID == 0 ]]
	then echo "Please run WITHOUT sudo(or root/superuser access)."
	exit
fi

#ova linija ispod obrise stari ./backup da bi se novi lepo kopirao
sudo rm -vr ./backup

#--------------

mkdir -pv backup/.config
mkdir -pv backup/.scripts
mkdir -pv backup/.local/share/fonts

mkdir -pv backup/.config/emacs

mkdir -pv backup/wallpaper
#--------------

sudo cp -rv ~/.config/nvim                     backup/.config/nvim
sudo cp -rv ~/.config/git                      backup/.config/git

sudo cp -v ~/.config/mimeapps.list             backup/.config/mimeapps.list

sudo cp -rv ~/.config/emacs/init.el            backup/.config/emacs/init.el
sudo cp -rv ~/.config/emacs/config.org         backup/.config/emacs/config.org
sudo cp -rv ~/.config/emacs/my_templates_ms    backup/.config/emacs/my_templates_ms

sudo cp -rv ~/.config/rclone                   backup/.config/rclone

sudo cp -rv ~/.scripts/*                       backup/.scripts/
sudo cp -v ~/.local/share/fonts/*              backup/.local/share/fonts

sudo cp -v ~/.inputrc                          backup/.inputrc

sudo cp -v ~/Pictures/wallpaper/wallpaper      backup/wallpaper/wallpaper

crontab -l > backup/crontab

mkdir -pv backup/dictionaries
cp -rv /usr/share/dict/hunspell-custom/* backup/dictionaries/

sudo chown -R $USER ./*
