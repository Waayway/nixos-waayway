{ config, pkgs, ... }:

{
  ## Home Manager needs a bit of information about you and the
  ## paths it should manage.
  home.username = "waayway";
  home.homeDirectory = "/home/waayway";

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
