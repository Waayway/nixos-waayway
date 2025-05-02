{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    fastfetch
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
  
  environment.variables.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";

  environment.variables.EDITOR = "nvim";
}
