{ config, pkgs, ...}: {
  home.packages = with pkgs; [
    tmux
  ];

  # Do something with tmux here.....
  home.file.".tmux.conf".source = ./tmux.conf;
}

## REFERENCES
# - https://github.com/breuerfelix/nixos/blob/main/shell/alacritty.nix
