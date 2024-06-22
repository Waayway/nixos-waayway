{
  description = "Nixos configuration waayway";


  inputs = {
    # have unstable if needed for some packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      nixosSystem = import ./lib/nixosConfig.nix;
      version = "24.05";
    in
    {
      nixosConfigurations = {
        wdesktop = nixosSystem "wdesktop" {
          inherit inputs nixpkgs version;
          hardware = {
            amdgpu = true;
            desktop = true;
            bluetooth = true;
          };
          system = "x86_64-linux";
          user = "waayway";
          fullname = "Thijs van Waaij";
        };
        wlaptop = nixosSystem "wlaptop" {
          inherit inputs nixpkgs version;
          hardware = {
            amdgpu = true;
            laptop = true;
            bluetooth = true;
          };
          system = "x86_64-linux";
          user = "waayway";
          fullname = "Thijs van Waaij";
        };
      };
    };
}
