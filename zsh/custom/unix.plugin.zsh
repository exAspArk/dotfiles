alias l="ls -al"
alias mkdir="mkdir -p"
alias perm='stat -f "%OLp"'
alias p='ps auxfww'
alias m='make'
alias t='tail'
alias tf='tail -f'
alias ports='lsof -i -n -P'
alias ':q'='exit'
c() {
  if hash pygmentize 2>/dev/null; then
    pygmentize -g $1
  else
    cat $1
  fi
}
alias pbc='pbcopy'
alias pbp='pbpaste'

# mert
alias ms='mert start'
