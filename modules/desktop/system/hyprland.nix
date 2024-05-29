{ inputs, pkgs, pkgs-unstable, ... }: {
  programs.hyprland = {
    enable = true;
    package = pkgs-unstable.hyprland;
  };




  environment.systemPackages = with pkgs; [
    # --Utils and more--
    wlr-randr
    brightnessctl
    swaynotificationcenter
    hyprpicker
    pamixer
    networkmanagerapplet
    playerctl

    # --Background--
    pkgs-unstable.swww

    # --Screenshots--
    grim
    slurp

    # --Overlays Bars and more--
    pkgs-unstable.waybar
    wlogout
    nwg-drawer
  ];
}
