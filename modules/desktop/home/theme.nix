{ config, pkgs, pkgs-unstable, ... }:

let
  catpuccin = pkgs-unstable.colloid-gtk-theme.override {
    colorVariants = [ "dark" ];
    tweaks = [ "rimless" "catppuccin" ];
  };
in
{
  # * GTK
  gtk = {
    enable = true;
    theme = {
      name = "Colloid-Dark-Catppuccin";
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
