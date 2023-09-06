{ config, pkgs, ... }:

{
  virtualisation = {
    podman = {
      enable = true;
    };
  };
}
