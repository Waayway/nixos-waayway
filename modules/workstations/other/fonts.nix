{ upkgs, ... }:
{
  fonts.packages = with upkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
