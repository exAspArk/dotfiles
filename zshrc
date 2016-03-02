# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arrow"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# Custom title for iTerm 2 tab
export DISABLE_AUTO_TITLE="true"
function title {
  echo -ne "\033]0;${PWD##*/}\007"
}

chpwd() {
  # Show contents of directory after cd-ing into it
  l
  # Show current directory for iTerm tab title
  title
}
chpwd

# Load zsh-autosuggestions.
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
