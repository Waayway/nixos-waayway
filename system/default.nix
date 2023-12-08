{ config, pkgs, inputs, system, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  imports = [
    ./boot.nix
    ./drivers
    ./programs
    ./programs.nix
  ];
}
