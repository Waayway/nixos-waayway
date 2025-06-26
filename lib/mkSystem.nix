{
  nixpkgs,
  overlays,
  inputs,
  version,
}:
system: name:
{ user }:
let

  upkgs = import inputs.nixpkgs-unstable {
    inherit system;

    config.allowUnfree = true;
  };

  machineOptions = import ../hosts/${name}.nix;
  hardware-profiles = machineOptions.hardware-profiles;
  isServer = machineOptions.isServer;
  isLaptop = machineOptions.isLaptop;
  isFramework = machineOptions.isFramework;
  isLinux = true; # TODO: Darwin

  colors = import ./color.nix { };

  machineConfig = machineOptions.config;

  baseConfig = ../modules/system.nix;

  extraArgs = {
    inherit version;
    currentUser = user;
    currentSystem = system;
    currentSystemName = name;
    currentVersion = version;
    inputs = inputs;

    color = colors;

    isServer = isServer;
    isLaptop = isLaptop;
    isFramework = isFramework;
    isLinux = isLinux;
    hardware-profiles = hardware-profiles;

    upkgs = upkgs; # Unstable pkgs

    user = user;

    umport = import ./umport.nix { lib = upkgs.lib; };
  };

  systemFunc = nixpkgs.lib.nixosSystem;

  homeManager = import ./mkHome.nix user extraArgs;

in
systemFunc rec {
  inherit system;

  specialArgs = extraArgs;

  modules = [
    { config = machineOptions.options; }
    {
      nixpkgs.overlays = overlays;
      nixpkgs.config.allowUnfree = true;
      nixpkgs.hostPlatform = system;
      system.stateVersion = version;
    }

    baseConfig

    machineConfig

    (if !isServer then homeManager else [ ])
  ];
}
