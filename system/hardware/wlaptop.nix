{ ... }:
{
  boot.kernelParams = [ "amd_pstate" ];
  imports = [
    ../drivers/amdgpu.nix
    ../drivers/bluetooth.nix
    ../drivers/power-management.nix
  ];
}
