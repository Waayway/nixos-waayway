{ pkgs, user, inputs, ... }:
{
  imports = [
    ./zsh.nix
    ./zoxide.nix
    ./dotconfig.nix
    ./theme.nix
    ./wezterm.nix
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  home.username = user.username;
  home.homeDirectory = "/home/${user.username}";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
