{
  description = "Nixos configuration **Waayway**";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      version = "24.11";
      x64 = "x86_64-linux";

      overlays = [ (final: prev: rec { }) ];

      mkSystem = import ./lib/mkSystem.nix {
        inherit
          overlays
          nixpkgs
          inputs
          version
          ;
      };

      mkUser = import ./lib/mkUser.nix;

    in
    {
      nixosConfigurations = {
        hephaestus = mkSystem x64 "hephaestus" {
          # Desktop (R9 5900x + 7900xtx)
          user = mkUser "waayway" { fullname = "Thijs van Waaij"; };
        };

        hermes = mkSystem x64 "hermes" {
          # Framework 13 R7 AI 300
          user = mkUser "waayway" { fullname = "Thijs van Waaij"; };
        };
      };
    };
}
