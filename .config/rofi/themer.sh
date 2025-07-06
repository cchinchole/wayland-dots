#!/bin/sh

WALLPAPERDIR=$HOME/Pictures/Backgrounds/

if [ -z $@ ]
then
function get_themes()
{
    ls $WALLPAPERDIR
}
echo current; get_themes
else
    THEMES=$@
    if [ x"current" = x"${THEMES}" ]
    then
        exit 0
        #wal -i `cat ~/.cache/wal/wal` > /dev/null
    elif [ -n "${THEMES}" ]
    then
        wal -o /home/kafka/scripts/reload.sh -i $WALLPAPERDIR${THEMES} --saturate 0.5 > /dev/null
        cp $WALLPAPEREDIR${THEMES} $HOME/.config/hypr/wallpaper
    fi
fi
