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
alias neovide="neovide"
alias vw="nvim -c v:lua require'v-vimwiki'.startVimwiki()"
alias notes='vim -c VimwikiIndex'
alias subl="open -a Sublime\ Text"
alias tableau="open /Applications/Tableau\ Desktop\ 2020.2.app --args --remote-debugging-port=8696"
alias tableau_2019="open /Applications/Tableau\ Desktop\ 2019.1.app --args --remote-debugging-port=8696"
alias tableau_beta="open /Applications/Tableau\ Desktop\ 2020.2.app --args --remote-debugging-port=8696"
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

# Path Exports
export PATH="$PATH:/Applications/Visual Studio Code.app/Conte,,.,nts/Resources/app/bin"
export PATH="$PATH:/Users/yoram/.composer/vendor/bin"
export PATH="$PATH:/usr/local/opt/php@7.4/bin"
export PATH="$PATH:/usr/local/opt/php@7.4/sbin"
export PATH="$PATH:/Users/yoram/Library/Python/3.9/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$HOME/.bin:$PATH"

fish_add_path /usr/local/sbin
