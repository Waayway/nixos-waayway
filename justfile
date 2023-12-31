host := `uname -a`

alias hm := home-manager-switch
alias sf := system-flake
alias uf := update-flake
alias cc := copy-config
alias gc := garbage-collect
alias ud := update-dotfiles

default: 
    @just --list 

home-manager-build:
    nix build path:.#homeManagerConfigurations.waayway.activationPackage
    
home-manager-build-verbose:
    nix build path:.#homeManagerConfigurations.waayway.activationPackage --show-trace

home-manager-switch: home-manager-build
    ./result/activate

system-flake HOST="":
    sudo nixos-rebuild switch --flake path:.#{{HOST}}

update-flake:
    nix flake update

copy-config:
    cp -r ./config/* ~/.config

copy-scripts:
    cp -r ./scripts/* ~/.local/bin

copy-hardware-config:
    cp /etc/nixos/hardware-configuration.nix ./system/hardware-configuration.nix

garbage-collect:
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d
    sudo nix store gc --debug
    home-manager expire-generations "-7 days"

install: copy-hardware-config copy-config system-flake home-manager-switch

update-dotfiles: 
    git add .
    git commit -m "Updated dotfiles"
    git push origin main


all: system-flake home-manager-switch