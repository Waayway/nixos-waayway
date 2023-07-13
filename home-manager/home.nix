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

  home.stateVersion = "23.05";


  programs.home-manager.enable = true;
}
