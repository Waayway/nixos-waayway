{ pkgs, user, hostname, ... }: {
  imports = [
    ./base
    ./desktop
    ./hardware
    ./user.nix
  ];
  environment.systemPackages = with pkgs; [
    git
    git-lfs

    # Archives
    zip
    xz
    zstd
    unzip
    p7zip

    # Text processing
    gnugrep
    gnused
    gawk
    jq

    # networking tools
    dnsutils
    wget
    curl
    nmap

    # Misc
    file
    findutils
    which
    tree
    gnutar
    rsync
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ user.username ];

    substituters = [
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  users.users.${user.username} = {
    description = user.fullname;
  };
}
