{ inputs, pkgs, pkgs-unstable, ... }: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

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
