#!/bin/bash

DIR=~/GitHub/Wallpapers/walls
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

if [[ $(pidof swaybg) ]]; then
    pkill swaybg
fi

swww query || swww init

dunstify "Changing wallpaper!" "W/ No Colourschemes" -u low -t 2000 -r 1001 -i daily-wallpaper
swww img ${DIR}/${RANDOMPICS} --transition-fps 160 --transition-duration 2 --transition-type any
