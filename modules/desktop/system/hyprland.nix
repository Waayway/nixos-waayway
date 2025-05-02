{ inputs, pkgs, lib, ... }: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  services.hypridle = {
    enable = true;
  };
  programs.hyprlock = {
    enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
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
    swww

    # --Screenshots--
    grim
    slurp

    # --Overlays Bars and more--
    waybar
    wlogout
    nwg-drawer

    # HyprCursor cursor
    rose-pine-hyprcursor

    # Hypr Ecosystem
    hyprpaper
  ];
}
