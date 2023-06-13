export PATH=./bin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

eval "$(/opt/homebrew/bin/brew shellenv)"
. /opt/homebrew/opt/asdf/libexec/asdf.sh

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

export BACKUP_PATH=~/Library/CloudStorage/Dropbox/_backups
export PROJECT_PATH=~/Documents/projects

# zlib for asdf python installation
# export LDFLAGS="-L/usr/local/opt/zlib/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include"
# export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
