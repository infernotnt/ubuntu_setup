#!/bin/bash

TERMINAL="alacritty"
TITLE=$1

output1=$(ps -aux | grep "alacritty --title $TITLE")
output2=$(printf "$output1" | grep -v "grep alacritty --title $TITLE")


number=$(printf "$output2" | wc -w)

if [ -z $output2 ]
then
    alacritty --title $TITLE
fi
