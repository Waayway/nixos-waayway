{ hardware, ... }:
let
  desktop = builtins.hasAttr "desktop" hardware && hardware.desktop;
in
{
  imports = [
    ./hyprland.nix
    ./packages.nix
    ./fonts.nix
    ./security.nix
    ./greetd.nix
    ./general.nix
    ./kernel.nix
  ] ++ (if (desktop) then [ ./steam.nix ] else [ ]);
  services.udisks2.enable = true;
}
