alias be='bundle exec'
alias bo="bundle open"
alias b='bundle'

alias srs='bundle exec spring rails s'
alias src='bundle exec spring rails c'
alias sr='bundle exec spring rspec'
alias srk='bundle exec spring rake'
alias ss='bundle exec spring stop'

alias s="sshrc"

if command -v nvim &> /dev/null; then
  alias v='ASDF_PYTHON_VERSION=3.10.4 PATH=/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH nvim'
else
  alias v='vim'
fi

alias t="ZSH_TERM=1 v -c ':e term://zsh'"

alias c="cat"
alias l="ls -al"
alias mkdir="mkdir -p"
alias perm='stat -f "%OLp"'
alias p='ps auxfww'
alias m='make'
alias tl='tail'
alias tf='tail -f'
alias ports='lsof -i -n -P'
alias ':q'='exit'
alias pbc='pbcopy'
alias pbp='pbpaste'
alias hist="history | awk '{a[\$2]++}END{for(i in a){print a[i] \" \" i}}' | sort -rn | head"
alias tree="find . -print | sed -e 's;[^/]*/;|__;g;s;__|; |;g'"

alias y='yarn'
alias mi='iex -S mix'
alias k='kubectl'

if [ -n "$ZSH_VERSION" ]; then alias git='nocorrect git'; fi
alias g='git'
alias ga='git add'
alias gap='git add -p'
alias gai='git add -i'
alias gaa='git add --all'
alias gb='git branch'
alias gbc='git branch --show-current && git branch --show-current | pbcopy' # copy current branch name
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbs='git branch --sort=-committerdate'
alias gbm='git branch --merged'
alias gbt='git branch --set-upstream-to=origin/$(git rev-parse --abbrev-ref HEAD) $(git rev-parse --abbrev-ref HEAD)'
alias gc='git commit -v --allow-empty'
alias gc!='git commit -v --amend'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout master 2> /dev/null || git checkout main'
alias gcd='git checkout develop'
alias gcs='git checkout staging'
alias gcp='git cherry-pick'
alias gd='git diff HEAD'
alias gdw='git diff HEAD --color-words'
alias gdf='git diff --name-status HEAD'
alias gds='git diff --staged'
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
alias gst='git status'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "WIP"'
glog() {
  local LAST_COMMIT_TIME="$(git log -1 --pretty=format:%cd)"
  local FORMAT=''
  FORMAT+='%C(bold blue)%h%C(reset) '    # abbreviated commit hash
  FORMAT+='%C(bold yellow)%d%C(reset) '  # ref name
  FORMAT+='%C(black)%s%C(reset) '        # commit message
  FORMAT+='%C(dim black)– %an%C(reset) ' # author name
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
gdm() {
  git diff $1^..$1
}
alias gclog="git log --no-merges --pretty=format:'%s (%an)'"
alias ggrep="git log --grep"
alias grs='git reset'
alias grsh='git reset --hard'
alias grss='git reset --soft HEAD~'
alias gres='git restore'
alias gress='git restore --staged'
greS() {
  git restore --staged $1 && git restore $1
}
alias grv='git revert'
alias gsh='git stash'
alias gshp='git stash pop'
alias gcl='git reset --hard HEAD'
alias gs='git show --color-words'
alias gsc='git rev-parse HEAD && git rev-parse HEAD | pbcopy' # copy current commit SHA
# commit count
alias gstats='git shortlog -sn --no-merges'
# lines count
alias glstats='git ls-files -z | xargs -0n1 git blame -w --line-porcelain | grep -a "^author " | sort -f | uniq -c | sort -n -r'

alias ghp='gh pr view --web'
alias ghr='gh repo view --web'
ghc() {
  local REPO_PATH=$(git remote -v | grep 'origin.*fetch' | sed -e 's/.*github.com:\(.*\)\.git (fetch)/\1/')
  open "https://github.com/${REPO_PATH}/commit/$1"
}
ghl() {
  local REPO_PATH=$(git remote -v | grep 'origin.*fetch' | sed -e 's/.*github.com:\(.*\)\.git (fetch)/\1/')
  local MAIN_BRANCH=$(gh repo view --json defaultBranchRef --jq .defaultBranchRef.name)
  local LINE_PATH=$(echo $1 | sed 's/:/#L/')
  open "https://github.com/${REPO_PATH}/blob/${MAIN_BRANCH}/${LINE_PATH}"
}
ghf() {
  local REPO_PATH=$(git remote -v | grep 'origin.*fetch' | sed -e 's/.*github.com:\(.*\)\.git (fetch)/\1/')
  local MAIN_BRANCH=$(gh repo view --json defaultBranchRef --jq .defaultBranchRef.name)
  local FILE_PATH=$1
  open "https://github.com/${REPO_PATH}/blob/${MAIN_BRANCH}/${FILE_PATH}"
}
ghb() {
  local REPO_PATH=$(git remote -v | grep 'origin.*fetch' | sed -e 's/.*github.com:\(.*\)\.git (fetch)/\1/')
  local MAIN_BRANCH=$(gh repo view --json defaultBranchRef --jq .defaultBranchRef.name)
  local LINE_PATH=$(echo $1 | sed 's/:/#L/')
  open "https://github.com/${REPO_PATH}/blame/${MAIN_BRANCH}/${LINE_PATH}"
}

vcompress() { # vcompress video.mp4 1280:720
  ffmpeg -i $1 -vcodec libx264 -crf 24 -vf scale=$2 output.mp4
}

vspeedup () { # vspeedup video.mp4 1.10
  ffmpeg -i $1 -vf "setpts=(PTS-STARTPTS)/$2" -af atempo=$2 "output-${2}x.mp4"
}
