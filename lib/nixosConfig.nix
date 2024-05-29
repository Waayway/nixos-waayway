name: { nixpkgs, inputs, system, user, fullname, version, hardware }:
let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit system;

    overlays = import ./unstable-overlays.nix;
  };
in
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit inputs version pkgs-unstable hardware;
    hostname = name;
    user = {
      username = user;
      fullname = fullname;
    };
    helpers = import ./default.nix;
  };
  modules = [
    ../hosts/${name}/hardware-config.nix
    ../modules/base.nix
    inputs.home-manager.nixosModules.home-manager
    {
      system.stateVersion = version;
    }
  ];
}
