#!/bin/sh

WALLPAPER_DIR="$HOME/.wallpapers/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"

#ls ~/.wallpapers | sort -R | tail -1 | while read file; do
#    swww img ~/.wallpapers/$file --transition-type center --transition-fps 144;
#done
