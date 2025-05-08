{ isServer, ... }: {
  imports = [ ./hardware.nix ./base ]
    ++ [ (if isServer then ./servers else ./workstations) ];
}
