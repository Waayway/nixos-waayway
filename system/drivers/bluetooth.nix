{ config, pkgs, ... }:

{
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
}
