{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # -- Music --
    spotify

    # -- Recording --
    obs-studio

    # -- Image --
    gimp
    krita

    # -- Video --
    mpv

    # -- Vector
    inkscape
    figma-linux
  ];
}
