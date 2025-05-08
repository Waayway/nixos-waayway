{ hardware-profiles, inputs, ... }: {
  imports =
    map (name: inputs.nixos-hardware.nixosModules.${name}) hardware-profiles;
}
