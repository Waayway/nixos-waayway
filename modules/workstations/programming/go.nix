{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    go_1_24
    gotools
    templ
    go-task
  ];
}
