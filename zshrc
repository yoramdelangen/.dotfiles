# Path to your oh-my-zsh installation.
export ZSH=/Users/Yoram/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

# Spaceship prompt options
SPACESHIP_TIME_SHOW=true

# Just comment a section if you want to disable it
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  #user         # Username section
  dir           # Current directory section
  #host         # Hostname section
  git           # Git section (git_branch + git_status)
  # hg          # Mercurial section (hg_branch  + hg_status)
  # package     # Package version (Disabled)
  node          # Node.js section
  # ruby        # Ruby section
  # elixir      # Elixir section
  # xcode       # Xcode section (Disabled)
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  # rust        # Rust section
  # haskell     # Haskell Stack section
  # julia       # Julia section (Disabled)
  docker      	# Docker section (Disabled)
  aws           # Amazon Web Services section
  venv          # virtualenv section
  # conda       # conda virtualenv section
  pyenv         # Pyenv section
  # dotnet      # .NET section
  # ember       # Ember.js section (Disabled)
  # kubecontext # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode     	# Vi-mode indicator (Disabled)
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

PROMPT_GEOMETRY_COLORIZE_ROOT=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git yarn zsh-syntax-highlighting zsh-syntax-highlighting git-flow zsh-autosuggestions)

# User configuration
export PATH="/opt/local/bin:/opt/local/sbin:/Users/Yoram/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/git/bin:/bin:/usr/bin:/usr/sbin:/sbin:/Users/Yoram/.composer/vendor/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# TMUX config
tmux() ( ORIG_PWD_FOR_TMUX="${PWD}" command tmux "$@"; )

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -f ~/.bash_exports ]; then
    . ~/.bash_exports
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
