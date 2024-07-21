{ helpers, lib, ... }: {
  imports = [
    ./user-group.nix
    ./networking.nix
    ./packages.nix
    ./locale.nix
    ./zram.nix
    ./core.nix
    ./ssh.nix
    ./nix.nix
    ./console.nix
    ./docker.nix
    ./boot.nix
  ];
}

