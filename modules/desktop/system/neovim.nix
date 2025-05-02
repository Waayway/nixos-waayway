{pkgs, ...}:
 
{
  environment.systemPackages = with pkgs; [
    lua-language-server
    stylua
    nixd
    emmet-ls
    nodePackages.intelephense

    gopls
 
    typescript-language-server
    tailwindcss-language-server
  ];
}
