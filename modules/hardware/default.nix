{ hardware, ... }:
let
  amdgpu = builtins.hasAttr "amdgpu" hardware && hardware.amdgpu;
  bluetooth = builtins.hasAttr "bluetooth" hardware && hardware.bluetooth;
  laptop = builtins.hasAttr "laptop" hardware && hardware.laptop;
  desktop = builtins.hasAttr "desktop" hardware && hardware.desktop;
  displaylink = builtins.hasAttr "displaylink" hardware && hardware.displaylink;
in
{
  imports = [ ] ++
    (if (amdgpu) then [ ./amdgpu.nix ] else [ ]) ++
    (if (bluetooth) then [ ./bluetooth.nix ] else [ ]) ++
    (if (desktop || laptop) then [ ./audio.nix ] else [ ]) ++
    (if (displaylink) then [ ./displaylink.nix ] else [ ]);
}
