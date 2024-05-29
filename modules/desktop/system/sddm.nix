_: {
  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = true;
      defaultSession = "hyprland";
    };
  };
}
