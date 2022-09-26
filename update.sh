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
#--------------

sudo cp -rv ~/.config/nvim                     backup/.config/nvim
sudo cp -rv ~/.config/git                      backup/.config/git

sudo cp -v ~/.config/mimeapps.list             backup/.config/mimeapps.list

sudo cp -rv ~/.scripts/*                       backup/.scripts/

sudo cp -v ~/.inputrc                          backup/.inputrc

sudo cp -v ~/.bashrc                           backup/.bashrc

sudo cp -v ~/.bash_profile                     backup/.bash_profile


sudo chown -R $USER ./*
