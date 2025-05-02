{ config, lib, pkgs, builtins, ... }:
with lib;
let
  cfg = config.modules.hardware.amdgpu;
  openglLibs = with pkgs; [
    libGL
    mesa
    libglvnd
    wayland
  ];
in
{
  options.modules.hardware.amdgpu = { enable = mkEnableOption "amdgpu"; };

  config = mkIf cfg.enable {

    environment.variables = {
      LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath openglLibs}";
      LIBGL_DRIVERS_PATH = "${pkgs.mesa}/lib/dri";
      LIBVA_DRIVERS_PATH = "${pkgs.mesa}/lib/dri";
    };

    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.kernelModules = [ "kvm-amd" ];
    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        amdvlk
        pkgs.mesa
        libglvnd
        vulkan-validation-layers
        libGL
        vulkan-loader
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ intel-media-driver intel-vaapi-driver ];
      package = pkgs.mesa;
    };
    hardware.enableRedistributableFirmware = true;

    systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
  };
}
