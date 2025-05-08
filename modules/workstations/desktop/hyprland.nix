{
  pkgs,
  upkgs,
  ...
}:
{
  programs.hyprland = {
    enable = true;
    package = upkgs.hyprland;
    portalPackage = upkgs.xdg-desktop-portal-hyprland;
  };

  services.hypridle = {
    enable = true;
    package = upkgs.hypridle;
  };

  programs.hyprlock = {
    enable = true;
    package = upkgs.hyprlock;
  };

  environment.sessionVariables = {
    # Fix for Electron Apps to say to use wayland
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    # --Utils and more--
    wlr-randr
    brightnessctl
    swaynotificationcenter
    pamixer
    networkmanagerapplet
    playerctl

    # --Screenshots--
    grim
    slurp

    # --Overlays Bars and more--
    waybar
    wlogout
    rofi-wayland

    # HyprCursor cursor
    rose-pine-hyprcursor

    # Hypr Ecosystem
    upkgs.hyprpicker
    upkgs.hyprpaper
  ];
}
