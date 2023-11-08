{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home-manager.nix
    ./programs/default.nix
  ];
}
