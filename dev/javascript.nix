{ pkgs, ... }: {

  home.packages = with pkgs; [
    yarn
    nodejs-slim-16_x
    nodePackages.npm
  ];
}