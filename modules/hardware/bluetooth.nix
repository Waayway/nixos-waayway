{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.hardware.bluetooth;
in
{
  options.modules.hardware.bluetooth = { enable = mkEnableOption "bluetooth"; };

  config = mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
    services.blueman.enable = true;
    systemd.user.services.mpris-proxy = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      blueberry
    ];
  };
}

