{ config, lib, ... }:
with lib;
let
  grub = config.modules.boot.grub;
in
{
  options.modules.boot.grub = { enable = mkEnableOption "grub"; };

  config = mkMerge [
    (mkIf (!grub.enable) {
      boot.loader.systemd-boot = {
        enable = true;
        configurationLimit = lib.mkDefault 10;
        consoleMode = lib.mkDefault "max";
      };
    })

    (mkIf grub.enable {
      boot.loader.grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
    })
    {
      boot.loader.efi.canTouchEfiVariables = true;
    }
  ];

}

