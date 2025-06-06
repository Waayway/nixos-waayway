{ pkgs, ... }:
{
  hardware.enableRedistributableFirmware = true;

  hardware.amdgpu.opencl.enable = true;

  hardware.amdgpu.amdvlk = {
    enable = true;
    support32Bit.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
    ];
  };
}
