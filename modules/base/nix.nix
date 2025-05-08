{ lib, user, ... }:
{
  nixpkgs.config.allowUnfree = lib.mkForce true;

  nix.settings.trusted-users = [ user.name ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

  nix.channel.enable = false;
}
