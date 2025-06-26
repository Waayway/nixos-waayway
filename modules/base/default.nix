{ ... }:
{
  imports = [
    ./user.nix
    ./nix.nix
    ./boot.nix
    ./locale.nix
    ./console.nix
    ./openssh.nix
    ./packages.nix
    ./networking.nix
    ./laptop.nix
  ];
}
