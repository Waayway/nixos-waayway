#!/bin/sh

ls ~/.config/dotfiles/wallpapers | sort -R | tail -1 | while read file; do
    swww img ~/.config/dotfiles/wallpapers/$file --transition-type center --transition-fps 60;
done