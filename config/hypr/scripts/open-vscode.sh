#!/bin/sh

# get workspace of vscode
workspace=$(hyprctl clients -j | jq ".[] | select(.initialClass == \"Code\").workspace.id")

if [ -z "$workspace" ]; then
  code
else
  hyprctl dispatch workspace $workspace
fi