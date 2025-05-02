{ home-manager, user, inputs, hostname, helpers, ... }: {
  imports = [
    ./zsh-system.nix
  ];
  home-manager.extraSpecialArgs = {
    inherit user inputs hostname helpers;
  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users."${user.username}" = import ./home.nix;
}
