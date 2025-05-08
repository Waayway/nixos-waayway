{
  pkgs,
  lib,
  config,
  ...
}:
let
  enabled = config.desktop.kde.enable;
in
{
  options.desktop.kde = {
    enable = lib.mkEnableOption "Enable KDE Desktop";
  };

  config = lib.mkIf enabled {

    # Install firefox.
    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      nixd
      nixfmt-rfc-style
      wl-clipboard
      spotify
      ripgrep
    ];

    # Enable the KDE Plasma Desktop Environment.
    services.desktopManager.plasma6.enable = true;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

}
