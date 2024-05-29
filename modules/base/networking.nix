{ lib, hostname, ... }: {
  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  networking.firewall.enable = lib.mkDefault true;

  services.avahi = {
    enable = true;
    publish = {
      enable = true;
      domain = true;
      userServices = true;
    };
  };
}
