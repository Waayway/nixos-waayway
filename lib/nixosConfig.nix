name: { nixpkgs, inputs, system, user, fullname, version }:
let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit system;

    overlays = import ./unstable-overlays.nix;
    config.allowUnfree = true;
  };
in
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit inputs version pkgs-unstable;
    hostname = name;
    user = {
      username = user;
      fullname = fullname;
    };
    helpers = import ./default.nix;
  };
  modules = [
    ../hosts/${name}
    ../modules/base.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-gaming.nixosModules.platformOptimizations
    {
      system.stateVersion = version;
    }
  ];
}
