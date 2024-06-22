{ config, pkgs, ... }:

let
  catpuccin_name = "Catppuccin-Mocha-Standard-Blue-Dark";
  catpuccin = pkgs.catppuccin-gtk.override {
    accents = [ "blue" ];
    tweaks = [ "rimless" ];
    variant = "mocha";
  };
in
{
  # * GTK
  gtk = {
    enable = true;
    theme = {
      name = catpuccin_name;
      package = catpuccin;
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
    platformTheme.name = "gtk";
  };
}
