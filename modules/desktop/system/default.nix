_: {
  imports = [
    ./hyprland.nix
    ./packages.nix
    ./fonts.nix
    ./security.nix
    ./greetd.nix
    ./general.nix
  ];
  services.udisks2.enable = true;
}
