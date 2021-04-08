# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="exaspark"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z)

source $ZSH/oh-my-zsh.sh

# Custom title for a terminal tab
export DISABLE_AUTO_TITLE="true"

# title function for terminal
title_pwd() { echo -ne "\033]0;${PWD##*/}\007" }

# after cd hook
chpwd() {
  # Show current directory for a terminal tab title
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

source /usr/local/opt/asdf/asdf.sh
export PATH="$PATH:$(yarn global bin)"
export PATH=$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"
export PATH="/usr/local/opt/docker-compose/bin:$PATH"

# load zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# kubectl
source <(kubectl completion zsh)

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/exaspark/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --ignore-case --no-ignore \
--exclude .git \
--exclude .next \
--exclude .deliver \
--exclude _build \
--exclude deps \
--exclude dist \
--exclude node_modules \
--exclude tmp"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
