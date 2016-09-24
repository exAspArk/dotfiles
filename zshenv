export ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh installation.

export VISUAL=nvim
export EDITOR=$VISUAL

export LANG=en_US.UTF-8 # You may need to manually set your language environment
export CC=/usr/bin/gcc

export PATH="./bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/local/bin"
export PATH=$PATH:"/usr/local/git/bin"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

export PATH=$PATH:/usr/local/heroku/bin # Added by the Heroku Toolbelt

# Load all of your custom configurations from custom/
for config_file (~/.zsh/custom/*.zsh(N)); do
  source $config_file
done
unset config_file

export BACKUP_PATH=~/Dropbox/_backups
export PROJECT_PATH=~/Documents/projects

# title function for iTerm
title_pwd() { echo -ne "\033]0;${PWD##*/}\007" }
