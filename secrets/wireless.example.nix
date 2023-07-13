{ config, pkgs, ... }:

{
  networking.wireless.networks = {
    your-wifi-with-wpa2-name = {
      psk = "YOUR WIFI PASSWORD";
    };
  };
}
