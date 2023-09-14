{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    lsd
  ];
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      ls = "lsd";
      l = "ls -l";
      la = "ls -la";
      ip = "ip --color=auto";
      cat = "bat";
    };

    plugins = with pkgs; [
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
      }
    ];
    initExtra = ''
          bindkey "^[[1;5C" forward-word
          bindkey "^[[1;5D" backward-word

          eval "$(direnv hook zsh)"

          export PATH="$HOME/.local/bin :$PATH"
          export PATH="$HOME/.cargo/bin :$PATH"
          export BUN_INSTALL="$HOME/.bun" 
          export PATH="$BUN_INSTALL/bin:$PATH" 

          export EDITOR="nvim"
    '';
  };
  programs.starship = {
    enable = true;
  };
}
