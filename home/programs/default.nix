{ config, pkgs, system, ... }:

{
  imports = [
    ./git.nix
    ./theme.nix
    ./zsh.nix
    ./direnv.nix
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
    gnome.gnome-calculator
    gnome.file-roller
    gnome.eog
    krita
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    bat
    distrobox

    onlyoffice-bin

    jetbrains-toolbox

    btop

    inkscape

    toolbox

    bottles

    ## Development
    # * Rust
    rustup
    just

    # * JS/TS
    nodejs_20
    deno
    obsidian

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

    # * ISO management
    ventoy-full
  ];
}

