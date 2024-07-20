{ pkgs, pkgs-unstable, ... }:


let
  swayConfig = pkgs.writeText "greetd-sway-config" ''
    exec "${pkgs-unstable.greetd.wlgreet}/bin/wlgreet -e Hyprland; swaymsg exit"
    bindsym Mod4+shift+e exec swaynag \
      -t warning \
      -m 'What do you want to do?' \
      -b 'Poweroff' 'systemctl poweroff' \
      -b 'Reboot' 'systemctl reboot'

    output "*" bg #000000 solid_color
  '';
in
{
  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    sway
    pkgs-unstable.greetd.wlgreet
  ];
}
