{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-calculator
    obsidian
  ];
}
