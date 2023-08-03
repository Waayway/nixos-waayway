host := `uname -a`

alias hm := home-manager-switch
alias sf := system-flake
alias uf := update-flake
alias cc := copy-config
alias gc := garbage-collect

default: 
    @just --list 

home-manager-build:
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

install: copy-hardware-config copy-config system-flake home-manager-switch



