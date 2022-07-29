set -g fish_emoji_width 2
set -Ux EDITOR nvim
set -Ux TERM "screen-256color"

set -gx Z_SCRIPT_PATH /usr/local/etc/profile.d/z.sh

# directoy movement
alias ls=exa
alias ll="exa -l"
alias lll="exa -la"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias dot="cd ~/.config/dotfiles"

# open Tooling
alias v="nvim"
alias vim="nvim"
alias subl="open -a Sublime\ Text"
alias dotfiles="cd $HOME/.dotfiles; nvim -n ."

# Notes
alias notes='cd ~/.vimwiki/; nvim -n ~/.vimwiki/index.md'
alias wiki='cd ~/.vimwiki/; nvim -n ~/.vimwiki/index.md'

alias tunnel_sydl="ssh -L 3333:localhost:3306 -N yoram@admin.sydl.nl"
alias tunnel_sydl_mongo="ssh -L 27017:localhost:27017 -N yoram@admin.sydl.nl"

# Development
alias a="php artisan"
alias art="php artisan"
alias cdu="composer dump-autoload"
alias c="composer"
alias comp="composer"
alias phpfix='php-cs-fixer fix . --config=/Users/yoram/.dotfiles/scripts/.php_cs.dist'
alias y='yarn'
alias ya='yarn add'
alias dockerclean='docker image prune -a -f; docker volume prune -f; docker network prune -f'

# Git
alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias gc="git commit"
alias gaa="git add --all"
alias gco="git checkout"
alias stash='git stash'
alias size='du -hs * | sort -h'
alias lg='lazygit'
alias ld='lazydocker'

# Applications & Tunnels
alias tableau="open /Applications/Tableau\ Desktop\ 2020.2.app --args --remote-debugging-port=8696"
alias tableau_2019="open /Applications/Tableau\ Desktop\ 2019.1.app --args --remote-debugging-port=8696"
alias tableau_beta="open /Applications/Tableau\ Desktop\ 2020.2.app --args --remote-debugging-port=8696"
alias tunnel_sydl="ssh -L 3333:localhost:3306 -N yoram@admin.sydl.nl"
alias tunnel_sydl_mongo="ssh -L 27017:localhost:27017 -N yoram@admin.sydl.nl"

# others
alias cc="clear"
alias myip='ifconfig | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"'
alias myssh='cat ~/.ssh/id_rsa.pub'
alias wm='~/.scripts/wm-control.sh'

function git_pull -d "Pull from current GIT repository"
   if test "$argv" != ""
        echo "👇 $argv"
        git pull -v --stat origin "$argv"
    else
        set current_branch (git rev-parse --abbrev-ref HEAD)

        if test "$current_branch" = ""
            set current_branch "master"
        end

        echo "👇 $current_branch"
        git pull -v --stat origin "$current_branch"
    end

end
alias pull=git_pull

function git_push -d "Push from current GIT repository"
   if test "$argv" != ""
        echo "👆 $argv"
        git push -u -v --progress origin "$argv"
    else
        set current_branch (git rev-parse --abbrev-ref HEAD)

        if test "$current_branch" = ""
            set current_branch "master"
        end

        echo "👆 $current_branch"
        git push -v --progress origin "$current_branch"
    end
end
alias push=git_push

# necessary for openssl in compiling PHP
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# Set GO Lang config
export GOPATH=$HOME/Workspace/go

# Path Exports
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/usr/local/Cellar/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$HOME/.bin:$PATH"
export PATH="$GOPATH:$PATH"
export PATH="$HOME/Workspace/go/bin:$PATH"

fish_add_path /usr/local/sbin

# pnpm
set -gx PNPM_HOME "/Users/yoram/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
