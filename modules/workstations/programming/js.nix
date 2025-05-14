{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nodejs_20
    deno
    bun
  ];
}
