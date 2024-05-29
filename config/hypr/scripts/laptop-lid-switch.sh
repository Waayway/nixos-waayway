#!/bin/sh

if grep open /proc/acpi/button/lid/LID/state; then
    hyprctl keyword monitor "desc:Chimei Innolux Corporation 0x1612, 1920x1200@60, 0x0, 1"
else
    if [[ `hyprctl monitors | grep "Monitor" | wc -l` != 1 ]]; then
       hyprctl keyword monitor "desc:Chimei Innolux Corporation 0x1612,disable" 
    fi
fi
