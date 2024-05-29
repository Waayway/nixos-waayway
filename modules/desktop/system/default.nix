_: {
  imports = [
    ./hyprland.nix
    ./sddm.nix
    ./packages.nix
    ./fonts.nix
    ./security.nix
  ];
  services.udisks2.enable = true;
}
