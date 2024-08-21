{ ... }:
{
  imports = [
    ./hyprland.nix
    ./packages.nix
    ./fonts.nix
    ./security.nix
    ./greetd.nix
    ./general.nix
    ./kernel.nix
    ./steam.nix
    ./dualbooting.nix
    ./neovim.nix
    ./caps2esc.nix

    ./frankwatching.nix
  ];
  services.udisks2.enable = true;
}
