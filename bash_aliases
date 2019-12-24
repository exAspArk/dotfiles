# bundle
alias be='bundle exec'
alias bo="bundle open"
alias b='bundle'

# git
alias g='git'
complete -F _complete_alias g
alias ga='git add'
complete -F _complete_alias ga
alias gap='git add -p'
alias gaa='git add --all'
alias gb='git branch'
alias gbd='git branch -d'
complete -F _complete_alias gbd
alias gbD='git branch -D'
complete -F _complete_alias gbD
alias gbs='git branch --sort=-committerdate'
alias gbm='git branch --merged'
alias gbt='git branch --set-upstream-to=origin/$(git rev-parse --abbrev-ref HEAD) $(git rev-parse --abbrev-ref HEAD)'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gco='git checkout'
complete -F _complete_alias gco
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcs='git checkout staging'
alias gcp='git cherry-pick'
alias gd='git diff HEAD --color-words'
alias gdf='git diff --name-status HEAD'
alias gds='git diff --staged'
alias gdm='git diff master...'
alias gbl='git blame'
alias gf='git fetch --all'
alias gl='git pull'
alias glr='git pull --rebase'
alias gp='git push'
alias gpf='git push --force-with-lease'
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
complete -F _complete_alias grbi
alias gst='git status'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'
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
glog() {
  local LAST_COMMIT_TIME="$(git log -1 --pretty=format:%cd)"
  local FORMAT=''
  FORMAT+='%C(bold blue)%h%C(reset) '    # abbreviated commit hash
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

# spring
alias rs='spring rails s'
alias rc='spring rails c'
alias sr='spring rspec'
alias rk='spring rake'
alias ss='spring stop'

# sshrc
alias s="sshrc"

alias l="ls -la --color"
complete -F _complete_alias l
alias mkdir="mkdir -p"
alias perm='stat -f "%OLp"'
complete -F _complete_alias perm
alias p='ps auxfww'
alias m='make'
complete -F _complete_alias m
alias t='tail'
complete -F _complete_alias t
alias tf='tail -f'
complete -F _complete_alias tf
alias ports='lsof -i -n -P'
alias ':q'='exit'
alias c='cat'
complete -F _complete_alias c
alias hist="history | awk '{a[\$2]++}END{for(i in a){print a[i] \" \" i}}' | sort -rn | head"

alias y='yarn'
complete -F _complete_alias y
alias mi='iex -S mix'

# neovim
if command -v nvim &> /dev/null; then
  alias v='ASDF_PYTHON_VERSION=3.8.1 nvim'
  complete -F _complete_alias v
else
  alias v='vim'
fi
