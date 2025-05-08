{
  hardware-profiles = [
    "common-cpu-amd"
    "common-cpu-amd-pstate"
    "common-gpu-amd"
    "common-pc"
    "common-pc-ssd"
  ];

  isServer = false;
  isLaptop = false;

  options.desktop.kde.enable = true;

  config =
    { ... }:
    {
      boot.initrd.kernelModules = [ "amdgpu" ];
      services.xserver.videoDrivers = [ "amdgpu" ];
      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "sd_mod"
      ];

      # Keep most default settings here
      boot.kernelModules = [ "kvm-amd" ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/1b7cad63-1f08-4b57-b35e-53cb671d4a1d";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/131E-A26F";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [ { device = "/dev/disk/by-uuid/75933563-25ea-4f27-a203-c9c9c5ac9a24"; } ];

    };

}
