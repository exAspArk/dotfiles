if [ -n "$ZSH_VERSION" ]; then alias git='nocorrect git'; fi
alias g='git'

alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbs='git branch --sort=-committerdate'
alias gbm='git branch --merged master'

alias gc='git commit -v'
alias gc!='git commit -v --amend'

alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcs='git checkout staging'

alias gcp='git cherry-pick'

alias gd='git diff HEAD'

alias gf='git fetch --all'

alias gl='git pull'
alias glr='git pull --rebase'

alias gp='git push'
alias gpt='git push --tags'

alias gt='git tag'

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

glog() {
  local LAST_COMMIT_TIME="$(git log -1 --pretty=format:%cd)"
  local FORMAT=''
  FORMAT+='%C(bold yellow)%d%C(reset) '  # ref name
  FORMAT+='%C(white)%s%C(reset) '        # commit message
  FORMAT+='%C(dim white)(%an)%C(reset) ' # author name
  FORMAT+='[%C(bold blue)%h%C(reset)] '  # abbreviated commit hash
  FORMAT+='(%C(bold green)%ar%C(reset))' # author date, relative

  git log --graph --all --before=$LAST_COMMIT_TIME --format=format:$FORMAT
}
alias gclog="git log --no-merges --pretty=format:'%s (%an)'"
alias ggrep="git log --grep"

alias grs='git reset'
alias grsh='git reset --hard'
alias grss='git reset --soft HEAD~'

alias grv='git revert'

alias gsh='git stash'
alias gshp='git stash pop'

alias gcl='git reset --hard HEAD'

alias gs='git show'
