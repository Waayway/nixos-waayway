{ config, pkgs, home, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
