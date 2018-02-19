# Devlopment alias
alias art='php artisan'
alias artisan='php artisan'
alias ip='ifconfig | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"'
alias ngrok='~/.ngrok'
alias myssh='cat ~/.ssh/id_rsa.pub'

# open editor
alias subl='open -a Sublime\ Text'
alias pstorm='open -a PhpStorm'
alias vscode='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

# open in browser
open_by_browser(){ open -a $1 $2}
alias firefox='open_by_browser "FirefoxDeveloperEdition"'
alias chrome='open_by_browser "Google Chrome"'
alias safari='open_by_browser safari'
alias opera='open_by_browser opera'

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
alias nope='git checkout .'
alias nah='git checkout .'
alias gd='git diff'
alias gu='git tag'
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
alias code='~/Code/'
alias bc='~/Code/Brandcube'
alias hosts='sudo vim /etc/hosts'
alias known_hosts='sudo vim /Users/yoramdelangen/.ssh/known_hosts'

# Others
alias _=sudo
alias lll="ls -la"
alias source_bash='source ~/.zshrc'
alias c='clear'
alias cc="osascript -e 'if application \"iTerm2\" is frontmost then tell application \"System Events\" to keystroke \"k\" using command down'"
alias phpfix='php-cs-fixer fix .  --config=/Users/Yoram/.scripts/php_cs.dist'
alias size='du -hs * | sort -h'

# PHPUnit
alias pu='phpunit'
alias puf='phpunit --filter'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

git_pull() {
    if [ ! -z "$1" ]; then
        echo "Pull from branch => $1"
        git pull -v --stat origin "$1"
    else
        echo "Pull from branch => $(parse_git_branch)"
        git pull -v --stat origin "$(parse_git_branch)"
    fi

	git fetch --tags
}
alias pull=git_pull

git_push() {
    if [ ! -z "$1" ]; then
        echo "Push on branch => $1"
        git push -u origin "$1"
    else
        echo "Push on branch => $(parse_git_branch)"
        git push -u origin "$(parse_git_branch)"
    fi
}
alias push=git_push
alias newversion=~/.scripts/new-version.sh

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}
alias hse="vim ~/Homestead/Homestead.yaml"
alias hs=homestead
