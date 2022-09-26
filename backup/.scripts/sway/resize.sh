#!/bin/bash
# This script was made by `goferito` on Github.
# Some cleanup by Luke.

[ -z "$1" ] && echo "No direction provided" && exit 1
distanceStr="2 px or 2 ppt"

moveChoice() {
  swaymsg resize "$1" "$2" 20 px
}
case $1 in
  up)
    moveChoice grow height
    ;;
  down)
    moveChoice shrink height
    ;;
  left)
    moveChoice grow width
    ;;
  right)
    moveChoice shrink width
    ;;
esac

exit 0
