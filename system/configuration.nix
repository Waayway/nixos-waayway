{ config, pkgs, ... }:
let
  user = config._module.args.currentUser;
  fullname = config._module.args.currentFullName;
in
{
  # * Some Setup for flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # * Networking
  networking.networkmanager.enable = true;

  # * User Setup
  users.users."${user}" = {
    isNormalUser = true;
    description = fullname;
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "docker" "libvirtd" ];
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
