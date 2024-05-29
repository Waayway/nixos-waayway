{ config, pkgs, ... }:

{
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
}
