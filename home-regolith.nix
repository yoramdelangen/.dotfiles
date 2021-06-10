{ config, lib, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    # What machine are we working on atm?
    ./machines/ubuntu-regolith.nix
    # ./machines/osx-work.nix

    # Shell
    ./shells/bash/index.nix

    # Utils - like fonts etc..
    # ./utils/fonts.nix
    
    ## Tools we installed on all machines
    # ./tools/alacritty/default.nix
    # ./tools/alacritty/ubuntu-regolith.nix
    ./tools/neovim/index.nix
    ./tools/tmux/index.nix
    ./tools/git/default.nix
    
    # Development tools
    ./dev/javascript.nix
  ];

  home.packages = with pkgs; [
    ## terminal tools
    exa
    bat
    fd

    # shell startup
    lolcat
    cowsay
    fortune
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}

# References/inspiration for this nix dotfiles configuration
# - https://hugoreeves.com/posts/2019/nix-home/
# - https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix 
