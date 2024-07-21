{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.hardware.audio;
in
{
  options.modules.hardware.audio = { enable = mkEnableOption "audio"; };
  config = mkIf cfg.enable {
    # Pipewire Audio
    nixpkgs.config.pipewire = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    environment.systemPackages = with pkgs; [
      pavucontrol
    ];
  };
}
