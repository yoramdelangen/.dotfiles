{ pkgs, ... }: {
  home.packages = with pkgs; [
    zsh
    starship
  ];
  
  programs.zsh = {
    enable = true;

    shellAliases = {
      lg = "lazygit";
      ll = "exa -l";
    };
    
    shellInit = ''
      echo "Testing does this load?"

      export XDG_CONFIG_HOME="$HOME/.config"
    '';
  };

  programs.starship = {
    enable = true;
  };

  programs.alacritty = {
    program = "zsh";
  };
}
