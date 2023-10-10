name: { nixpkgs, inputs, system, user, fullname }:

nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit system inputs;  };
  modules = [
    ../system/hardware/${name}.nix
    ../hosts/${name}/default.nix
    ../system/configuration.nix
    ../system

    {
      networking.hostName = name;
    }
    {
      config._module.args = {
        currentSystemName = name;
        currentSystem = system;
        currentUser = user;
        currentFullName = fullname;
      };
    }
  ];
} 
