{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neofetch
    neovim
    just

    strace
    ltrace
    bpftrace
    tcpdump
    lsof

    sysstat
    iotop
    iftop
    btop
    nmon
    sysbench

    psmisc
    lm_sensors
    ethtool
    pciutils
    usbutils
    hdparm
    dmidecode
    parted
  ];

  environment.variables.EDITOR = "nvim";
}
