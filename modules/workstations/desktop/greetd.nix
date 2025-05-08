{ pkgs, ... }:
let
  catpuccin = pkgs.colloid-gtk-theme.override {
    colorVariants = [ "dark" ];
    tweaks = [
      "rimless"
      "catppuccin"
    ];
  };
in
{
  # Enable Display Manager
  services.greetd = {
    enable = true;
  };

  programs.regreet = {
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
      name = "Rose-Pine";
      package = pkgs.rose-pine-cursor;
    };
  };
}
