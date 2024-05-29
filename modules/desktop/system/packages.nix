{ pkgs, pkgs-unstable, ... }: {
  environment.systemPackages = with pkgs; [
    # --Applications--
    ### Various
    gnome.gnome-calculator
    cinnamon.nemo
    # --Applications/Web--
    firefox
    brave

    # --Applications/Multimedia--
    spotify
    obs-studio
    mpv
    gimp
    krita
    inkscape

    # --Applications/Terminal--
    kitty

    # --Applications/Office--
    libreoffice

    # --Prorgamming--
    ### Various
    gh # GithubCLI

    # --Programming/Rust--
    rustup

    # --Programming/Typescript--
    nodejs_20
    deno
    pkgs-unstable.bun

    # --Programs/Python--
    python3
    python3Packages.pip
    python3Packages.virtualenv

    # --Utils--
    wl-clipboard
    wl-mirror # -- Mirror screen to second monitor
    ripgrep # -- Needed for neovim config

    # --Development--
    docker-compose
    gcc
    pkg-config

    rustup
  ];
}
