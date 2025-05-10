{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  environment.sessionVariables = {
    # Fix for Electron Apps to say to use wayland
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    # --Utils and more--
    ### Display
    wlr-randr
    brightnessctl

    ### Sound
    playerctl
    pamixer

    ### Other
    swaynotificationcenter
    networkmanagerapplet

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
    pkgs.hyprpicker
    pkgs.hyprpaper
  ];
}
