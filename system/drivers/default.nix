{ config, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./disk-management.nix
  ];
}
