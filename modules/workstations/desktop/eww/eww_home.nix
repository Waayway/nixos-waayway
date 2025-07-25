{ pkgs, color, ... }:
let
  basePath = "modules/workstations/desktop/eww/config";
in
{
  home.packages = with pkgs; [
    eww
    socat
    libnotify
  ];

  home.activation.installConfig = ''
    if [ ! -e ~/.config/eww ]; then
      ln -s ~/.flake/${basePath} ~/.config/eww
    fi
  '';

  home.file.".flake/${basePath}/style/_colors.scss".text = with color; ''
    $background : #${background};
    $foreground : #${foreground};
    $background-alt : #${mbg};
    $background-light : #${color0};
    $foreground-alt : #${color7};
    $red : #${color1};
    $red-light : #${color9};

    $green : #${color2};
    $green-light : #${color10};


    $yellow : #${color3};
    $yellow-light : #${color11};

    $blue : #${color4};
    $blue-light : #${color12};

    $cyan : #${color6};
    $cyan-light : #${color14};

    $magenta : #${color5};
    $magenta-light : #${color13};

    $comment : #${comment};
    $accent : #${accent};
  '';
}
