{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./theme.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    kitty
    brave
    vscode
    spotify
    pavucontrol
    nixpkgs-fmt
    discord
    obs-studio
    mpv
    gh
    neofetch
    filezilla
    nextcloud-client
    calibre
    gimp
    imagemagick
    rclone

    ## Development
    # * Rust
    rustc
    cargo
    just

    # * JS/TS
    nodejs_20

    # * Go
    go
    gopls

    # * Python
    python312

    # * Nix
    rnix-lsp

    # * iso burning
    popsicle

    # * Gaming
    steam
  ];
}

