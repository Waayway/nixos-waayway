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
  # GTK 4
  home.file.".config/gtk-4.0/gtk.css".source = "${catpuccin}/share/themes/${catpuccin_name}/gtk-4.0/gtk.css";
  home.file.".config/gtk-4.0/gtk-dark.css".source = "${catpuccin}/share/themes/${catpuccin_name}/gtk-4.0/gtk-dark.css";

  home.file.".config/gtk-4.0/assets" = {
    recursive = true;
    source = "${catpuccin}/share/themes/${catpuccin_name}/gtk-4.0/assets";
  };

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
    platformTheme = "gtk";
  };
}
