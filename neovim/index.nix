{ config, lib, pkgs, ... }: 

{
  # Install neovim 0.5
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  home.packages = with pkgs; [
    neovide
  ];

  # Neovim configuration
  programs.neovim = {
    enable = true;
    
    # we want to alias all vim an vi command to nvim
    vimAlias = true;
    viAlias = true;
    
    # make sure we install neovim 0.5
    package = pkgs.neovim-nightly;

    extraConfig = with lib.strings; concatMapStrings (x: fileContents x + "\n") [
      ./src/init.vim
      ./src/vim-plug.vim
      ./src/plugins.vim
      ./src/movement.vim
      ./src/plugins/telescope.vim
    ];
  };
}

# REFERENCES
# - https://github.com/malob/nixpkgs/blob/master/home/neovim.nix
# - https://github.com/breuerfelix/nixos/blob/main/shell/vim/init.nix
