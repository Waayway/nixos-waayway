{
  description = "Dotfiles Nix Waayway";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

      lib = nixpkgs.lib;

    in
    {
      homeManagerConfigurations = {
        waayway = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/home.nix
            ./programs/zsh.nix
          ];
        };
      };

      nixosConfigurations = {
        wlaptop = lib.nixosSystem {
          inherit system;

          modules = [
            # System stuff
            ./system/hardware-configuration.nix
            ./system/boot.nix
            ./system/amdgpu.nix
            ./system/audio.nix
            ./system/bluetooth.nix
            ./system/fonts.nix
            ./system/power-management.nix
            ./system/systemPackages.nix

            # Programs
            ./programs/docker.nix
            ./programs/flatpak.nix
            ./programs/gnome-polkit.nix
            ./programs/hyprland.nix
            {
              # * Some Setup for flakes
              nix.settings.experimental-features = [ "nix-command" "flakes" ];

              # * Networking
              networking.hostName = "wlaptop";
              networking.networkmanager.enable = true;


              # * User Setup
              users.users.waayway = {
                isNormalUser = true;
                description = "Thijs van Waaij";
                extraGroups = [ "networkmanager" "wheel" "audio" "video" "docker" ];
              };

              users.defaultUserShell = pkgs.zsh;
              programs.zsh.enable = true;
              environment.shells = with pkgs; [ zsh ];

              # * Timezones and keyboard layouts
              # Set your time zone.
              time.timeZone = "Europe/Amsterdam";

              # Select internationalisation properties.
              i18n.defaultLocale = "en_US.UTF-8";

              i18n.extraLocaleSettings = {
                LC_ADDRESS = "nl_NL.UTF-8";
                LC_IDENTIFICATION = "nl_NL.UTF-8";
                LC_MEASUREMENT = "nl_NL.UTF-8";
                LC_MONETARY = "nl_NL.UTF-8";
                LC_NAME = "nl_NL.UTF-8";
                LC_NUMERIC = "nl_NL.UTF-8";
                LC_PAPER = "nl_NL.UTF-8";
                LC_TELEPHONE = "nl_NL.UTF-8";
                LC_TIME = "nl_NL.UTF-8";
              };

              # Configure keymap in X11 and wayland apperantly
              services.xserver = {
                layout = "us";
                xkbVariant = "euro";
              };

              # Set system version
              system.stateVersion = "23.05";
            }
          ];
        };
      };
    };
}
