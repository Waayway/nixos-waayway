{ config, lib, ... }:
with lib;
let
  cfg = config.modules.hardware.displaylink;
in
{
  options.modules.hardware.displaylink = { enable = mkEnableOption "displaylink"; };

  config = mkIf cfg.enable {
    services.xserver.videoDrivers = [ "displaylink" "modesetting" ];
  };
}
