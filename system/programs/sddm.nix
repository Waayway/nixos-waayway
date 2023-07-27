{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true; # *  Using SDDM since lightdm was buggy with hyprland
  };
}
