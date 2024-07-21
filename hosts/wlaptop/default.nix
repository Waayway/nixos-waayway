{ ... }: {
  imports = [
    ./hardware-config.nix
  ];
  config.modules = {
    hardware = {
      amdgpu.enable = true;
      bluetooth.enable = true;
      audio.enable = true;
      displaylink.enable = true;
    };
  };
}
