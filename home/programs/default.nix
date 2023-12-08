{ config, pkgs, system, unstable, ... }:

{
  imports = [
    ./git.nix
    ./theme.nix
    ./zsh.nix
    ./direnv.nix
    ./ags.nix
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6"
  ];

  home.packages = with pkgs; [
    kitty
    brave
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
    cinnamon.nemo
    cinnamon.nemo-fileroller
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
    python311
    python311Packages.pip
    python311Packages.virtualenv
    python311Packages.django

    # * Nix
    rnix-lsp

    # * Elixir
    elixir
    erlang

    # * iso burning
    popsicle

    # * Gaming
    steam


    # * ISO management
    ventoy-full

    wl-mirror

    ungoogled-chromium
    libreoffice
    android-studio

    # * PHP
    php

    # Other
    socat
    pulseaudio
  ];
}

