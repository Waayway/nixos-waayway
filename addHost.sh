#!/usr/bin/env bash

echo "Enter name of config:"

read configName

nixos-generate-config --show-hardware-config > ./hosts/$configName.nix

