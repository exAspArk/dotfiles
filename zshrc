# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arrow"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(cap brew bundle gem git lein osx rails rbenv redis-cli ruby)

alias git='nocorrect git'

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

source ~/.zsh-autosuggestions/autosuggestions.zsh
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/go/bin:/usr/texbin"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval "$(rbenv init -)"
export CC=/usr/bin/gcc
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/rbenv/shims:/usr/local/opt/rbenv/bin:./bin:$GOPATH/bin

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
