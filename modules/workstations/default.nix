{ umport, ... }:
{
  imports =
    [
      ./kernel.nix
      ./graphics.nix
    ]
    ++ umport {
      paths = [
        ./other
        ./gaming
        ./desktop
        ./terminal
        ./programming
        ./applications
      ];
      recursive = true;
      includeHome = false;
    };
}
