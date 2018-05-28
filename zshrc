# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="exaspark"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z)

source $ZSH/oh-my-zsh.sh

# Custom title for iTerm 2 tab
export DISABLE_AUTO_TITLE="true"

# after cd hook
chpwd() {
  # Show current directory for iTerm tab title
  # Show contents of directory
  # Asynchronously
  (title_pwd &)
}

# use a zsh_history from backup directory if it's newer
sync_zsh_history() {
  if [[ $BACKUP_PATH/zsh_history -nt ~/.zsh_history ]]; then
    echo "Synced zsh_history file from backup directory"
    cp $BACKUP_PATH/zsh_history ~/.zsh_history;
  fi
}

# ON LOAD: ####################################################################

chpwd # emulate cd action
(sync_zsh_history &)

# #############################################################################

# load rbenv if available
if command -v rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# load nvm
export NVM_DIR="$HOME/.nvm"
nvm() {
  . "$(brew --prefix nvm)/nvm.sh" --no-use
  nvm $@
}

# no default shell ruby version in Neovim terminal
rbenv shell --unset

# load pyenv if available
if command -v pyenv &>/dev/null ; then
  eval "$(pyenv init -)"
fi

# load zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='gfind . ! -path "./.git/*" ! -path "./node_modules/*" -type f -printf "%P\n"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# cd to selected directory, by default from NY_PROJECT_PATH
fd() { cd "$(gfind ${1:-$PROJECT_PATH} ! -path '*/\.*' ! -path '*/node_modules/*' -type d | fzf -0)" }
# edit file
fe() { v $(fzf) }
