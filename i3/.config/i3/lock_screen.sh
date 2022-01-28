#!/bin/bash

if [ $(grep -r "RUNNING" /proc/asound | wc -l) -eq 0 ];
then 
    i3lock -i /home/jacob/Pictures/Wallpapers/grand-teton-national-park-sunset-hills-blur.png -f -t
fi
