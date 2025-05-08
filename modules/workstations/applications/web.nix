{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    ungoogled-chromium

  ];
}
