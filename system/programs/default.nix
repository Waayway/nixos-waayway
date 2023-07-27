{ config, pkgs, ... }:

{
  imports = [
    ./docker.nix
    ./flatpak.nix
    ./fonts.nix
    ./gnome-polkit.nix
    ./hyprland.nix
    ./sddm.nix
    ./sway.nix
  ];
}
