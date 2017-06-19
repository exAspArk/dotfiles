if [ -n "$ZSH_VERSION" ]; then alias git='nocorrect git'; fi
alias g='git'

alias ga='git add'
alias gap='git add -p'
alias gaa='git add --all'

alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbs='git branch --sort=-committerdate'
alias gbm='git branch --merged'
alias gbt='git branch --set-upstream-to=origin/$(git rev-parse --abbrev-ref HEAD) $(git rev-parse --abbrev-ref HEAD)'

alias gc='git commit -v'
alias gc!='git commit -v --amend'

alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcs='git checkout staging'

alias gcp='git cherry-pick'

alias gd='git diff HEAD --color-words'
alias gdf='git diff --name-status HEAD'
alias gds='git diff --staged'

alias gbl='git blame'

alias gf='git fetch --all'

alias gl='git pull'
alias glr='git pull --rebase'

alias gp='git push'
alias gpf='git push -f'
alias gpt='git push --tags'
alias gpu='git push -u origin'

alias gt='git tag'

alias gm='git merge --no-ff'
alias gmu='git merge upstream/$(git_current_branch)'

alias gr='git remote'
alias gra='git remote add'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'
alias grbi='git rebase -i'

alias gst='git status'

alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'

glog() {
  local LAST_COMMIT_TIME="$(git log -1 --pretty=format:%cd)"
  local FORMAT=''
  FORMAT+='%C(bold blue)%h%C(reset) '    # abbreviated commit hash
  FORMAT+='%C(dim green)%G?%C(reset)'    # verified commit
  FORMAT+='%C(bold yellow)%d%C(reset) '  # ref name
  FORMAT+='%C(white)%s%C(reset) '        # commit message
  FORMAT+='%C(dim white)– %an%C(reset) ' # author name
  FORMAT+='%C(dim yellow)(%ad)'          # author date custom

  git log \
    --graph \
    --branches \
    --remotes \
    --tags \
    --topo-order \
    --before="$LAST_COMMIT_TIME" \
    --format=format:"$FORMAT" \
    --date=iso
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

alias gs='git show --color-words'

# commit count
alias gstats='git shortlog -sn --no-merges'

# lines count
alias glstats='git ls-files -z | xargs -0n1 git blame -w --line-porcelain | grep -a "^author " | sort -f | uniq -c | sort -n -r'
