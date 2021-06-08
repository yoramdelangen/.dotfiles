{ pkgs, ... }: {
  home.packages = with pkgs; [
    zsh
    starship
  ];
  
  programs.zsh = {
    enable = true;

    shellAliases = {
      # lg = "lazygit";
    }
  };
}
