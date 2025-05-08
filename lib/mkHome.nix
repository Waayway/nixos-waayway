user:
extraArgs@{ inputs, version, ... }:
let home-manager = inputs.home-manager.nixosModules.home-manager;
in { ... }: {
  imports = [ home-manager ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = extraArgs;
  home-manager.users.${user.name} = { ... }: {
    imports = [ ../modules/workstations/home.nix ];
    home.stateVersion = version;
  };
}
