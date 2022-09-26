#!/bin/bash

# This script is used in the init.vim file. It compiles the currently editing *.md file to the .pdf equivalent in the same directory.

#Idea got from: https://www.youtube.com/watch?v=zB_3FIGRWRU&t=2s
#Useful: https://www.youtube.com/watch?v=wh_WGWii7UE

filename=$1
target=$filename
outputFile="${filename%.*}.pdf"


pandoc \
     $target \
     -o "$outputFile" &


#target="$(dirname "${filename}")/../pdf"
#outputFile="$(basename "$filename" .md).pdf"

#pandoc \
##     --pdf-engine=xelatex \
#     $target \
#     -o "$outputFile" &
##     -o "$target/$outputFile" $filename &

exit 0
