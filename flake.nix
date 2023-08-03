{
  description = "Dotfiles Nix Waayway";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixos-generators, ... }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

      lib = nixpkgs.lib;

      nixosSystem = import ./lib/nixosSystem.nix;
    in
    {
      homeManagerConfigurations = {
        waayway = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home
          ];
        };
      };

      nixosConfigurations = {
        wlaptop = nixosSystem "wlaptop" {
          inherit nixpkgs;
          system = "x86_64-linux";
          user = "waayway";
          fullname = "Thijs van Waaij";
        };
        wpc = nixosSystem {
          system = "x86_64-linux";
          user = "waayway";
          fullname = "Thijs van Waaij";
        };
      };
    };
}
