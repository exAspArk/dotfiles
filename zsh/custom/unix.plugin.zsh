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
  if which bat 2>/dev/null; then
    bat $1
  else
    cat $1
  fi
}
alias pbc='pbcopy'
alias pbp='pbpaste'
alias hist="history | awk '{a[\$2]++}END{for(i in a){print a[i] \" \" i}}' | sort -rn | head"

alias ms='mert start'
alias y='yarn'
alias mi='iex -S mix'
