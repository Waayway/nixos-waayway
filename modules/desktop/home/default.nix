{ home-manager, user, inputs, hostname, helpers, pkgs-unstable, ... }: {
  imports = [
    ./zsh-system.nix
  ];
  home-manager.extraSpecialArgs = {
    inherit user inputs hostname helpers pkgs-unstable;
  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users."${user.username}" = import ./home.nix;
}
