{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    lazygit
    htop
    neofetch
  ];

  # Git
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.git.enable
  # Aliases config imported in flake.
  programs.git.enable = true;

  programs.git = {
    userEmail = "yoramdelangen@gmail.com";
    userName = "Yoram de Langen";
    ignores = [
      ".idea" ".vs" ".vsc" ".vscode" # ide
      ".DS_Store" # mac
      "node_modules" "npm-debug.log" # npm
      "__pycache__" "*.pyc" # python
      ".ipynb_checkpoints" # jupyter
      "__sapper__" # svelte
    ];
  };

  # set git specific aliases
  programs.zsh.shellAliases = {
    lg = "lazygit";
    gs = "git status";
  };

  # Enhanced diffs
  programs.git.delta.enable = true;
}
