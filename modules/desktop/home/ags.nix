{inputs, pkgs, ...}:
{
  imports = [inputs.ags.homeManagerModules.default];
  
  home.packages = with pkgs; [
    inputs.ags.packages.${pkgs.system}.io
    inputs.ags.packages.${pkgs.system}.battery
    inputs.ags.packages.${pkgs.system}.hyprland
    inputs.ags.packages.${pkgs.system}.notifd
    inputs.ags.packages.${pkgs.system}.network
    inputs.ags.packages.${pkgs.system}.tray
    inputs.ags.packages.${pkgs.system}.bluetooth
    inputs.ags.packages.${pkgs.system}.wireplumber
  ];

  programs.ags = {
    enable = true;

    configDir = ../../../config/ags;

    extraPackages = with pkgs; [
      inputs.ags.packages.${pkgs.system}.battery
      inputs.ags.packages.${pkgs.system}.hyprland
      inputs.ags.packages.${pkgs.system}.notifd
      inputs.ags.packages.${pkgs.system}.network
      inputs.ags.packages.${pkgs.system}.tray
      inputs.ags.packages.${pkgs.system}.bluetooth
      inputs.ags.packages.${pkgs.system}.wireplumber
    ];
  };
}
