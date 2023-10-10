{
  description = "Dotfiles Nix Waayway";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # - Programs as Inputs
    wam = {
      url = "/home/waayway/code/Hyprland-stuff/wam";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixunstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, ... } @ inputs:
  # home-manager, wam, nixunstable, hyprland,
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      unstablepkgs = import inputs.nixunstable {
        inherit system;
        config = { allowUnfree = true; };
      };

      lib = nixpkgs.lib;

      nixosSystem = import ./lib/nixosSystem.nix;
    in
    {
      homeManagerConfigurations = {
        waayway = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home

            # - Programs as Inputs
            {
              home.packages = [ 
                inputs.wam.packages.${system}.default
                unstablepkgs.bun
              ];
            }
          ];
        };
      };

      nixosConfigurations = {
        wlaptop = nixosSystem "wlaptop" {
          inherit nixpkgs inputs;
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
