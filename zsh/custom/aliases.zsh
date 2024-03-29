# Standard #############################################################################################################

alias c="cat"
alias l="ls -al"
alias mkdir="mkdir -p"
alias perm='stat -f "%OLp"'
alias m='make'
alias tl='tail'
alias tf='tail -f'
alias ports='lsof -i -n -P'
alias ':q'='exit'
alias pbc='pbcopy'
alias pbp='pbpaste'
alias hist="history | awk '{a[\$2]++}END{for(i in a){print a[i] \" \" i}}' | sort -rn | head"
alias tree="find . -print | sed -e 's;[^/]*/;|__;g;s;__|; |;g'"
alias ip="dscacheutil -q host -a name"
alias ns='scutil --dns | grep nameserver | sort -u'


# Nix ##################################################################################################################

alias ninstall='darwin-rebuild switch'
alias nupgrade='nix-channel --update && nix-env --upgrade'
alias nsearch='nix-env -qaP'
nuninstall() {
  nix-env --uninstall $1 && nix-collect-garbage
}

# SSH ##################################################################################################################

alias s="sshrc"
alias sk="kitty +kitten ssh" # will create ~/.terminfo on the remote server to fix "top" and other terminal issues

# Vim ##################################################################################################################

if command -v nvim &> /dev/null; then
  alias v='nvim'
else
  alias v='vim'
fi
alias t="VIM_TERM=1 v -c ':e term://zsh'"

# Ctags ################################################################################################################

alias ttr='gem ctags >/dev/null && fd --type file --extension rb --print0 | xargs -0 ripper-tags --extra=q -R -a -f tags_tmp && mv tags_tmp tags'
alias ttj='fd --type file --extension js --extension jsx --extension ts --extension tsx --print0 | xargs -0 ctags -R -a -f tags_tmp && mv tags_tmp tags'
alias tte='fd --type file --extension ex --extension exs --print0 | xargs -0 ctags -R -a -f tags_tmp && mv tags_tmp tags'

# Ruby #################################################################################################################

alias be='bundle exec'
alias bo="bundle open"
alias b='bundle'
alias srs='bundle exec spring rails s'
alias ss='bundle exec spring stop'
sr() {
  if bundle exec spring &> /dev/null; then
    bundle exec spring rspec $@
  else
    bundle exec rspec $@
  fi
}
srk() {
  if bundle exec spring &> /dev/null; then
    bundle exec spring rake $@
  else
    bundle exec rake $@
  fi
}
src() {
  if bundle exec spring &> /dev/null; then
    bundle exec spring rails c $@
  else
    bundle exec rails c $@
  fi
}

# JS ###################################################################################################################

alias p='pnpm'
alias y='yarn'

# Elixir ###############################################################################################################
#
alias mi='iex -S mix'

# Kubernetes ###########################################################################################################

alias k='kubectl'
alias kg='kubectl get'
kgp() { # kgp namespace-name
  if [ -z "$1" ]; then
    kubectl get pods | grep -v Completed
  else
    kubectl get pods -n $1 | grep -v Completed
  fi
}
alias kgpw="watch -n 1 'kubectl get pod'"
alias kgpa='kubectl get pods'
alias kgn='kubectl get nodes -o custom-columns=NODE:.metadata.name,ARCH:.status.nodeInfo.architecture && kubectl get pod -o custom-columns=NODE:.spec.nodeName,NAME:.metadata.name --all-namespaces | sort'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kdel='kubectl delete'
alias ke='kubectl edit'
kex() { # kex pod-name container-name
  if [ -z "$2" ]; then
    kubectl exec -it $1 -- bash
  else
    kubectl exec -it $1 -c $2 -- bash
  fi
}
kexsh() {
  kubectl exec -it $1 -- sh
}
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kt='kubectl top'
alias kp='kubectl port-forward'
alias kr='kubectl rollout restart deployment'
alias kk='kubectl kustomize'
alias kga="kubectl get \$(kubectl api-resources --namespaced=true --no-headers -o name | egrep -v 'events|nodes' | paste -s -d, - ) --no-headers"
kn() { # kn namespace-name
  if [ -z "$1" ]; then
    kubectl get namespaces
    echo ""
    kubectl config view --minify -o jsonpath='{..namespace}'
  else
    kubectl config set-context --current --namespace=$1
  fi
}
ksealed() {
  kubectl get secret $1 -o json | jq '.data | map_values(@base64d)'
}
kseal() { # kseal my-secret KEY1=val1 KEY2=val2 or kseal my-secret.yaml
  secret_name="$1"
  shift

  # If secret_name ends with .yaml
  if [[ $secret_name == *.yaml ]]; then
    cat $secret_name | kubeseal --format yaml > sealed-secret.temp.yaml
    mv sealed-secret.temp.yaml $secret_name
    return
  fi

  keyvals=""
  for keyval in "$@"; do
    keyvals="$keyvals --from-literal=$keyval"
  done

  if test -f sealed-secret.yaml; then
    eval "kubectl create secret generic $secret_name --dry-run=client $keyvals -o yaml | kubeseal --format yaml --merge-into sealed-secret.yaml"
  else
    eval "kubectl create secret generic $secret_name --dry-run=client $keyvals -o yaml | kubeseal --format yaml > sealed-secret.yaml"
  fi
}

# Git ##################################################################################################################

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
# gdiff <file1> <file2>
alias gdiff='git diff --color-words --no-index'

# GitHub ###############################################################################################################

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

# Ffmpeg ###############################################################################################################

# vcompress video.mp4 1280:720
vcompress() {
  ffmpeg -i $1 -vcodec libx264 -crf 24 -vf scale=$2 output.mp4
}
# vspeedup video.mp4 1.10
vspeedup () {
  ffmpeg -i $1 -vf "setpts=(PTS-STARTPTS)/$2" -af atempo=$2 "output-${2}x.mp4"
}
# vconcat
vconcat() {
  [ -e _concat-list.txt ] && rm _concat-list.txt
  for f in *.mov; do
    echo "file $f" >> _concat-list.txt
  done
  ffmpeg -f concat -i _concat-list.txt -c copy out.mov && rm _concat-list.txt
}
