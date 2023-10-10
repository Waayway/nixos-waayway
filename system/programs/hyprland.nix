{ config, pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = false;
    };
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };
}
