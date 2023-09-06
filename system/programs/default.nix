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
    ./chrome-cast.nix
    ./virtual-machine.nix
    ./adb.nix
    ./podman.nix
  ];
}
