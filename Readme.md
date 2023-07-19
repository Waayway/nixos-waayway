# Actuall good setup of nixos

Had a setup of nixos was trying it out but was always lacking in how to set it up....

now with some more knowledge made this.

Thank the heavens for Wil T for his youtube series on nixos and flakes without it i would have been very lost.

## Programs and services i am using

-   Hyprland
-   Waybar
-   dunst
-   swww
-   hyprpicker
-   nwg-drawer
-   and many more, but these are the main ones for the desktop

## Some images

![](./images/mainDesktop.png)
![](./images/neofetch.png)
![](./images/editing.png)

## How to install

Enable nix and flakes in configuration.nix with

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

Then run

```bash
sudo nixos-rebuild switch
```

Then run

```bash
./install.sh
```

within this repo
