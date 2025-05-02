{
  description = "Nixos configuration **Waayway**";

  inputs = {
    # have unstable if needed for some packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

# catppuccin.url = "github:catppuccin/nix"; Was previously for gtk theme

    hyprland.url = "github:hyprwm/Hyprland";

    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input  
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, ... }:
    let
      nixosSystem = import ./lib/nixosConfig.nix;
      version = "25.05";
    in
    {
      nixosConfigurations = {
        wdesktop = nixosSystem "wdesktop" {
          inherit inputs nixpkgs version;
          system = "x86_64-linux";
          user = "waayway";
          fullname = "Thijs van Waaij";
        };

        wlaptop-fw = nixosSystem "wlaptop-fw" {
          inherit inputs nixpkgs version;
          system = "x86_64-linux";
          user = "waayway";
          fullname = "Thijs van Waaij";
        };

        wlaptop = nixosSystem "wlaptop" { # OLD idk how relevant this still is
          inherit inputs nixpkgs version;
          system = "x86_64-linux";
          user = "waayway";
          fullname = "Thijs van Waaij";
        };
      };
    };
}
