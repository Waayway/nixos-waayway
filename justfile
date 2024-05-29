host := `uname -a`

alias sf := system-flake
alias uf := update-flake
alias ud := update-dotfiles

default: 
    @just --list 

system-flake HOST="":
    sudo nixos-rebuild switch --flake path:.#{{HOST}}

update-flake:
    nix flake update

copy-hardware-config:
    cp /etc/nixos/hardware-configuration.nix ./system/hardware-configuration.nix

update-dotfiles: 
    git add .
    git commit -m "Updated dotfiles"
    git push origin main

