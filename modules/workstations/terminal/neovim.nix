{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim

    # -- LSP (Language server protocols) --

    ## Lua
    lua-language-server
    stylua

    ## Nix
    nixd

    ## HTML + Styling
    emmet-ls
    tailwindcss-language-server

    ## PHP
    nodePackages.intelephense

    ## Golang
    gopls

    ## Typescript
    typescript-language-server
  ];
}
