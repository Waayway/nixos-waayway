{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Thijs van Waaij";
    userEmail = "thijs@vanwaaij.com";
  };
}
