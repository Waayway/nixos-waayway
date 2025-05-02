name: { nixpkgs, inputs, system, user, fullname, version }:
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit inputs version;
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
