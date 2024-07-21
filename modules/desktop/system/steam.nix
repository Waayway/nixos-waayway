{ config, pkgs, pkgs-unstable, lib, ... }:

with lib;
let
  cfg = config.modules.software.steam;
in
{
  options.modules.software.steam = { enable = mkEnableOption "steam"; };

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      dedicatedServer.openFirewall = false;
      extest.enable = true;
      package = pkgs-unstable.steam.override {
        extraEnv = {
          MANGOHUD = true;
        };
      };
      platformOptimizations = {
        enable = true;
      };
    };
    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs-unstable; [
      mangohud
      gamescope
      steamtinkerlaunch
    ];
  };
}
