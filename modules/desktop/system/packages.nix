{ pkgs, pkgs-unstable, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    themechanger
    # --Applications--
    ### Various
    gnome-calculator
    nemo
    pass-wayland

    # --Applications/Web--
    firefox
    pkgs-unstable.brave
    inputs.zen-browser.packages."${system}".specific
    figma-linux

    # --Applications/Communication--
    vesktop
    slack

    # --Applications/Multimedia--
    spotify
    obs-studio
    mpv
    gimp
    krita
    inkscape

    # --Applications/Terminal--
    pkgs-unstable.kitty
    inputs.wezterm.packages."${pkgs.system}".default

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
    openssl

    rustup
  ];
}
