{inputs, pkgs, ...}:

{
  imports = [inputs.ags.homeManagerModules.default];

  programs.ags = {
    enable = true;
  };
}