{ config, pkgs, ... }:

{
  imports = [
    ./amdgpu.nix
    ./audio.nix
    ./bluetooth.nix
    ./disk-management.nix
    ./power-management.nix
  ];
}
