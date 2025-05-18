{ umport, ... }:
{
  imports = umport {
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
