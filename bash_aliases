#!/bin/bash

# Code check with analyzer tool
# Url: https://www.shellcheck.net/
# or via commandline:
# brew install shellcheck; shellcheck ~/.bash_aliases

# development aliases
alias art='php artisan'
alias a='php artisan'
alias artisan='php artisan'
alias ip='ifconfig | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"'
alias ngrok='~/.ngrok'
alias myssh='cat ~/.ssh/id_rsa.pub'
alias dotfiles='git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME/.dotfiles'
alias watch='yarn run watch'
alias prod='yarn run prod'
alias devel='yarn run dev'
alias py='python'
alias pip='/usr/local/bin/pip3'
alias tableau="open /Applications/Tableau\ Desktop\ 2020.2.app --args --remote-debugging-port=8696"
alias tableau_beta="open /Applications/Tableau\ Desktop\ 2020.2.app --args --remote-debugging-port=8696"
alias tunnel_sydl="ssh -L 3333:localhost:3306 -N yoram@admin.sydl.nl"
alias tunnel_sydl_mongo="ssh -L 27017:localhost:27017 -N yoram@admin.sydl.nl"

# yarn aliases
alias y='yarn'
alias ya='yarn add'

# open editor
alias v="nvim"
alias vim="nvim"
alias subl='open -a Sublime\ Text'
alias pstorm='open -a PhpStorm'
alias vscode='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias pycharm='open -a PyCharm\ CE'

# open in browser
open_by_browser(){ open -a "$1" "$2"; }
alias firefox='open_by_browser "FirefoxDeveloperEdition"'
alias chrome='open_by_browser "Google Chrome"'
alias safari='open_by_browser safari'
alias opera='open_by_browser opera'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'
alias gb='git branch'
alias gs='git status -u'
alias gt='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias commit='git commit'
alias status='git status -u'
alias checkout='git checkout'
alias branch='git branch'
alias stash='git stash'
alias fetch='git fetch'
alias nope='git checkout .'
alias nah='git checkout .'
alias gf='git fetch'
alias gd='git diff'
alias gu='git tag'
alias gitclean='git branch --merged >/tmp/merged-branches && vi /tmp/merged-branches && xargs git branch -d </tmp/merged-branches'
alias cdu='composer dump-autoload'
alias cu='composer update'
alias ci='composer install'

# Quick locations/navigation
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ~='cd ~'
alias sites='cd ~/Sites/'
alias hosts='sudo nvim /etc/hosts'
alias known_hosts='sudo vim /Users/yoramdelangen/.ssh/known_hosts'
switch_project() { cd ~/Sites/"$1" || return; }
alias project=switch_project

# Quick edit configs
alias ezsh="vim ~/.zshrc"
alias ealias="vim ~/.bash_aliases"

# Others
alias _=sudo
alias ls="ls -G"
alias lll="ls -la"
alias source_bash='source ~/.zshrc'
alias c='clear'
alias cc="osascript -e 'if application \"iTerm2\" is frontmost then tell application \"System Events\" to keystroke \"k\" using command down'"
alias phpfix='php-cs-fixer fix . --config=/Users/yoram/.dotfiles/scripts/.php_cs.dist'
alias size='du -hs * | sort -h'

# PHPUnit
alias pu='phpunit'
alias puf='phpunit --filter'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

git_pull() {
    if [ -n "$1" ]; then
        echo "Pull from branch => $1"
        git pull -v --stat origin "$1"
    else
        if [[ -z "$(parse_git_branch)" ]]; then
            BR='master'
        else
            BR=$(parse_git_branch)
        fi

        echo "Pull from branch => $BR"
        git pull -v --stat origin "$BR"
    fi

    git fetch --tags
}
alias pull=git_pull

git_push() {
    if [ -n "$1" ]; then
        echo "Push on branch => $1"
        git push origin "$1"
    else
        if [[ -z "$(parse_git_branch)" ]]; then
            BR='master'
        else
            BR="$(parse_git_branch)"
        fi
        echo "Push on branch => $BR"
        git push origin "$BR"
    fi

    while true; do
        read -r "yn?Pushing tags? [Nn|Yy] "
        declare -l yn

        if [[ $yn == "y" ]]; then
           git push origin --tags
           break;
        else
           break;
        fi
    done
}
alias push=git_push
alias newversion=~/.scripts/new-version.sh

alias mvim="mvim -v"
