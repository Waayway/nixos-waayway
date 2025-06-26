{
  pkgs,
  isFramework,
  inputs,
  ...
}:
let
  frameworkConfig = {
    programs.fw-fanctrl = {
      enable = true;
      config = {
        defaultStrategy = "medium";
      };
    };
  };
in
{
  imports =
    [ ]
    ++ (
      if isFramework then
        [
          inputs.fw-fanctrl.nixosModules.default
        ]
      else
        [ ]
    );

  config = if isFramework then frameworkConfig else { };
}
