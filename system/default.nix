{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./drivers
    ./programs
  ];
  environment.systemPackages = with pkgs;
    [
      neovim
      git
      tmux
      wlr-randr
      wdisplays
      wl-clipboard
      zsh
      starship
      xfce.thunar
      themechanger
      killall
      htop
      brightnessctl

      # Hyprland Stuff
      hyprland
      xdg-desktop-portal-hyprland
      (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      }))
      dunst
      swww
      hyprpicker
      pamixer
      jq
      # Screenshots
      grim
      slurp
      # Other
      wlogout
      nwg-drawer
      swayosd
      playerctl
      # Bluetooth
      blueberry

      docker-compose
    ];
}
