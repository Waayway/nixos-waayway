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

![](./images/out.png)

## How to install

The default install of nixos doesn't have flakes enabled so you need to enable it within configuration.nix

```bash
sudo nano /etc/nixos/configuration.nix # to open the file
```

then add this line to the file within the {}

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

then run

```bash
sudo nixos-rebuild switch
```

Nixos also doesn't have git nor just installed so install it temporarily using nix-shell -p

```bash
nix-shell -p git just
```

then clone this repo

```bash
git clone https://github.com/Waayway/nixos-waayway
```

then cd into the repo

```bash
cd nixos-waayway
```

then run
just install will copy config files and compile the flake for both the home-manager and the system

```bash
just install
```

then reboot and you should be good to go
