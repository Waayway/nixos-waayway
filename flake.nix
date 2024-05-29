{
  description = "Nixos configuration waayway";

  inputs = {
    # have unstable if needed for some packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      nixosSystem = import ./lib/nixosConfig.nix;
      version = "23.11";
    in
    {
      nixosConfigurations = {
        wlaptop = nixosSystem "wlaptop" {
          inherit inputs nixpkgs version;
          hardware = {
            amdgpu = true;
            laptop = true;
            bluetooth = true;
            displaylink = true;
          };
          system = "x86_64-linux";
          user = "waayway";
          fullname = "Thijs van Waaij";
        };
      };
    };
}
