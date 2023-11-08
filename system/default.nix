{ config, pkgs, inputs, system, ... }:

let
  unstablepkgs = import inputs.nixunstable {
    inherit system;
    config = { allowUnfree = true; };
  };
in
{
  nixpkgs.config.allowUnfree = true;
  imports = [
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
      themechanger
      killall
      htop
      brightnessctl

      # Hyprland Stuff
      # hyprland
      xdg-desktop-portal-hyprland
      unstablepkgs.waybar
      # (waybar.overrideAttrs (oldAttrs: {
      #   mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      # }))
      swaynotificationcenter
      swww
      hyprpicker
      pamixer
      jq
      networkmanagerapplet
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

      # Develop stuff
      docker-compose
      gcc
      pkg-config
      unzip
      gnumake
      udisks
    ];
}
