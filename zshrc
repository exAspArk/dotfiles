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

# load zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# kubectl
source <(kubectl completion zsh)

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="gfind . \
! -path \"./.deliver/*\" \
! -path \"./.git/*\" \
! -path \"./_build/*\" \
! -path \"./deps/*\" \
! -path \"./dist/*\" \
! -path \"./node_modules/*\" \
-type f -printf \"%P\n\""
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# cd to selected directory, by default from NY_PROJECT_PATH
fd() { cd "$(gfind ${1:-$PROJECT_PATH} ! -path '*/\.*' ! -path '*/node_modules/*' -type d | fzf -0)" }
# edit file
fe() { v $(fzf) }
