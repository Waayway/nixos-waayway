host := `uname -a`

alias hm := home-manager-switch
alias sf := system-flake
alias uf := update-flake
alias cc := copy-config

home-manager-build:
    nix build path:.#homeManagerConfigurations.waayway.activationPackage --show-trace
    
home-manager-switch: home-manager-build
    ./result/activate


system-flake:
    sudo nixos-rebuild switch --flake path:.#config

update-flake:
    nix flake update

copy-config:
    cp -r ./config/* ~/.config

copy-hardware-config:
    cp /etc/nixos/hardware-configuration.nix ./system/hardware-configuration.nix

install: copy-hardware-config cc sf hm



