#!/bin/bash

# If you application launcher is not called "alacritty --title application_launcher...." then you will need to modify this file.

TERMINAL="alacritty"
TITLE=$1

# Starts an "application launcher", that is actually just clever use of fzf

# output2 = List of processes that are assumed to be the apllication launcher
output1=$(ps -aux | grep "alacritty --title $TITLE")
output2=$(printf "$output1" | grep -v "grep alacritty --title $TITLE")

number=$(printf "$output2" | wc -w)

if [ "${number}" -gt 1 ]
     then
          printf "$output2" | awk '{print $2}' | xargs -r kill
     else
          #$TERMINAL --title application_launcher -e bash -c "compgen -c | grep -v fzf | sort -u | fzf --layout=reverse | xargs -r swaymsg -t command exec"
          $TERMINAL --title $TITLE -e bash -c "compgen -c | fzf --layout=reverse | xargs -r swaymsg -t command exec"
fi

exit 0
