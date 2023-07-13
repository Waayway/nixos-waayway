{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = false;
    };
  };

  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true; # * Using SDDM since lightdm was buggy with hyprland
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };
}
