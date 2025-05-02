{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.hardware.fingerprint;
in
{
  options.modules.hardware.fingerprint = { enable = mkEnableOption "fingerpint"; };

  config = mkIf cfg.enable {
    systemd.services.fprintd = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Type = "simple";
    };

    services.fprintd = {
      enable = true;
    };
  };
}

