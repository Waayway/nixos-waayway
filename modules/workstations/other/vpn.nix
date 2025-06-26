{ pkgs, ... }:
{
  services.cloudflare-warp = {
    enable = true;
    openFirewall = true;
  };
}
