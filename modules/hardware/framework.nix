{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.hardware.framework;
in
{
  options.modules.hardware.framework = { enable = mkEnableOption "framework"; };

  config = mkIf cfg.enable {
    services.fwupd.enable = true;
  };
}

