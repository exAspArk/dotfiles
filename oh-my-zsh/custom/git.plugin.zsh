alias git='nocorrect git'
alias g='git'

alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'

alias gc='git commit -v'
alias gc!='git commit -v --amend'

alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcd='git checkout develop'

alias gcp='git cherry-pick'

alias gd='git diff'
gdv() { git diff -w "$@" | view - }

alias gf='git fetch'

alias gl='git pull'
alias glr='git pull --rebase'

alias gp='git push'
alias gpt='git push --tags'

alias gm='git merge --no-ff'
alias gmu='git merge upstream/$(git_current_branch)'

alias gr='git remote'
alias gra='git remote add'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'

alias gst='git status'

alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'

alias glog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

alias grs='git reset'
alias grsh='git reset --hard'
alias grss='git reset --soft HEAD~'

alias gsh='git stash'
alias gshp='git stash pop'
