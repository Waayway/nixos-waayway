{ config, pkgs, ... }:

{
  ## Home Manager needs a bit of information about you and the
  ## paths it should manage.
  home.username = "waayway";
  home.homeDirectory = "/home/waayway";

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

    ## Development
    # * Rust
    rustc
    cargo

    # * JS/TS
    nodejs_20

    # * Go
    go
    gopls

    # * Python
    python312

    # * Nixos iso generation
    nixos-generators
    popsicle
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };

  # Qt
  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  home.stateVersion = "23.05";


  programs.home-manager.enable = true;
}
