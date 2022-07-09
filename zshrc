# Remove paths prepended automatically
PATH=$(echo "$PATH" | sed -e 's|/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:||')
export PATH=$PATH:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="exaspark"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z)

DISABLE_AUTO_UPDATE=true
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

export PATH="$PATH:$(yarn global bin)"
# export PATH=$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin

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
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --ignore-case --no-ignore --strip-cwd-prefix \
--exclude .git \
--exclude .next \
--exclude .deliver \
--exclude _build \
--exclude deps \
--exclude dist \
--exclude node_modules \
--exclude log \
--exclude cue.mod \
--exclude tmp"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#4d4d4c,bg:#eeeeee,hl:#004e9c
  --color=fg+:#4d4d4c,bg+:#e8e8e8,hl+:#004e9c
  --color=info:#4271ae,prompt:#c18401,pointer:#e45649
  --color=marker:#4271ae,spinner:#4271ae,header:#4271ae'
