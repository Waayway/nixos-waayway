#!/bin/sh

ls ~/.wallpapers | sort -R | tail -1 | while read file; do
    swww img ~/.wallpapers/$file --transition-type center --transition-fps 60;
done
