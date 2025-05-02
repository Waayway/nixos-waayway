{ pkgs, user, inputs, ... }:
{
  imports = [
    ./zsh.nix
    ./zoxide.nix
    ./dotconfig.nix
    ./theme.nix
    ./zen-browser.nix
  ];
  home.username = user.username;
  home.homeDirectory = "/home/${user.username}";

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
