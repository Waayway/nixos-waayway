{ config, pkgs, system, unstable, ... }:

{
  imports = [
    ./git.nix
    ./theme.nix
    ./zsh.nix
    ./direnv.nix
    ./ags.nix
  ];
}

