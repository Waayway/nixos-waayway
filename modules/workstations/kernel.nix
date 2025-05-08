{
  pkgs,
  isLinux,
  lib,
  ...
}:
{
  config = lib.mkIf isLinux {
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
