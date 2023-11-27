export PNPM_HOME=/Users/exaspark/Library/pnpm

export PATH=./bin
export PATH="$PATH:$PNPM_HOME"
export PATH=$PATH:/run/current-system/sw/bin # nix-darwin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

export ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh installation.

export VISUAL=nvim
export EDITOR=$VISUAL

export LANG=en_US.UTF-8 # You may need to manually set your language environment
export CC=/usr/bin/gcc

# Load all of your custom configurations from custom/
for config_file (~/.zsh/custom/*.zsh(N)); do
  source $config_file
done
unset config_file

export ERL_AFLAGS="-kernel shell_history enabled" # iex history for Elixir

export BACKUP_PATH=~/Dropbox/_Backups
export PROJECT_PATH=~/Documents/Code

export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
