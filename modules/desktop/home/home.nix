{ pkgs, user, ... }:

{
  imports = [
    ./zsh.nix
    ./zoxide.nix
    ./dotconfig.nix
    ./theme.nix
  ];
  home.username = user.username;
  home.homeDirectory = "/home/${user.username}";

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
