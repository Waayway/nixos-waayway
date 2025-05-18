{
  hardware-profiles = [ "framework-amd-ai-300-series" ];

  isServer = false;
  isLaptop = true;

  options = {
    desktop = {
      kde.enable = true;
    };
    bluetooth.enable = true;
  };

  config =
    { ... }:
    {
      boot.initrd.kernelModules = [ "amdgpu" ];
      services.xserver.videoDrivers = [ "amdgpu" ];
      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "thunderbolt"
        "usb_storage"
        "uas"
        "sd_mod"
      ];
      boot.kernelModules = [ "kvm-amd" ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/8969cdc0-96d7-407e-a19c-4251ae7e10b6";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/153C-E867";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [ { device = "/dev/disk/by-uuid/b306c09a-cee7-47bc-a243-759717c008e4"; } ];
    };
}
