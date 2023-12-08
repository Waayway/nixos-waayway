{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home-manager.nix
    ./programs
    ./programs.nix
  ];
}
