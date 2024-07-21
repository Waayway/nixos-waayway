{ config, lib, pkgs, pkgs-unstable, ... }:
with lib;
let
  cfg = config.modules.dualboot;
in
{
  options.modules.dualboot = { enable = mkEnableOption "dualboot"; };

  config = mkIf cfg.enable {
    time.hardwareClockInLocalTime = true;
  };
}

