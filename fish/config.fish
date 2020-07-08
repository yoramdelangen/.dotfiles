# directoy movement
alias lll="ls -la"
alias ..="cd ../../"
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias .....="cd ../../../../../"

# Tooling
alias v="nvim"
alias vim="nvim"

# Git
alias gs="git status"
alias gd="git diff"
alias gc="git commit"
alias gaa="git add --all"

# others
alias cc="clear"

function git_pull -d "Pull from current GIT repository" 
   echo "Argv: $argv" 
   echo "$0"
   if test "$argv" != ""
        echo "Pull: $argv"
        git pull -v --stat origin "$argv"
    else
        set current_branch (git rev-parse --abbrev-ref HEAD)

        if test "$current_branch" = ""
            set current_branch "master"
        end

        echo "Pull: $current_branch"
        git pull -v --stat origin "$current_branch"
    end

end
alias pull=git_pull

function git_push -d "Push from current GIT repository" 
   if test "$argv" != ""
        echo "Push: $argv"
        git push -u -v --progress origin "$argv"
    else
        set current_branch (git rev-parse --abbrev-ref HEAD)

        if test "$current_branch" = ""
            set current_branch "master"
        end

        echo "Push: $current_branch"
        git push -v --progress origin "$current_branch"
    end

end
alias push=git_push

export PATH="$PATH:/Applications/Visual Studio Code.app/Conte,,.,nts/Resources/app/bin"
