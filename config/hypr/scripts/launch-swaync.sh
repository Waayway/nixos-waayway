#!/bin/sh

kill -9 $(pidof dunst)

# Launch swaync
swaync
