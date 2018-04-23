#!/bin/sh
#Written by David

export STARDICT_DATA_DIR="/home/david/Documents"
word=$(xclip -o)
xsel -c

if [ "$word" = "% " ]||[ "$word" = "" ]||[ -z ${word+x} ]; then
    word=$(zenity --title="Dictionary" --entry --text "Enter A word" --entry-text "word")
fi

echo $word
if [ "$word" != "" ]; then
    explain=$(sdcv -ne $word)
fi

# echo $explain
zenity --notification --text $explain
# notify-send $explain
