{pkgs, pkgs-unstable, ...}:
 
{
  environment.systemPackages = with pkgs; [
    lua-language-server
    stylua
    nixd
    emmet-ls
    nodePackages.intelephense
 
    pkgs-unstable.typescript-language-server
    pkgs-unstable.tailwindcss-language-server
  ];
}
