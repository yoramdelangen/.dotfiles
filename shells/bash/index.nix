{ pkgs, ... }: {
  home.packages = with pkgs; [
    starship
  ];
  
  programs.bash = {
    enable = true;

    shellAliases = {
      lg = "lazygit";
      gs = "git status";
      ls = "exa";
      ll = "exa -l";
      hm = "home-manager";
    };
    
    initExtra = ''
      fortune | cowsay | lolcat
      export XDG_CONFIG_HOME="$HOME/.config"
    '';
  };

  programs.starship = {
    enable = true;
  };

  programs.alacritty = {
    settings = {
      shell = {
        program = "fish";
        args = [
          "-C"
          "neofetch"
        ];
      };
    };
  };
}
