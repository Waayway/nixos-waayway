{ lib, ... }: {
  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };
}
