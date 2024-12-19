{
  description = "Nixos configuration **Waayway**";

  inputs = {
    # have unstable if needed for some packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    ags.url = "github:aylur/ags";
    
    wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:MarceColl/zen-browser-flake";
    };
  };

  outputs = inputs@{ nixpkgs, ... }:
    let
      nixosSystem = import ./lib/nixosConfig.nix;
      version = "24.11";
    in
    {
      nixosConfigurations = {
        wdesktop = nixosSystem "wdesktop" {
          inherit inputs nixpkgs version;
          system = "x86_64-linux";
          user = "waayway";
          fullname = "Thijs van Waaij";
        };
        wlaptop = nixosSystem "wlaptop" {
          inherit inputs nixpkgs version;
          system = "x86_64-linux";
          user = "waayway";
          fullname = "Thijs van Waaij";
        };
      };
    };
}
