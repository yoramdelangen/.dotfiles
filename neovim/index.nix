{ config, pkgs, ... }: 

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
  };

  xdg.configFile."nvim/init.vim".source = ./init.vim;
  xdg.configFile."nvim/vim-plug.vim".source = ./vim-plug.vim;
  xdg.configFile."nvim/movement.vim".source = ./movement.vim;
  xdg.configFile."nvim/plugins/telescope.vim".source = ./plugins/telescope.vim;
}

# References: 
# - https://github.com/malob/nixpkgs/blob/master/home/neovim.nix
