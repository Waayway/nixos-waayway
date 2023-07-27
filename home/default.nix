{ config, pkgs, ... }:

{
  imports = [
    ./home-manager.nix
    ./programs/default.nix
  ];
}
