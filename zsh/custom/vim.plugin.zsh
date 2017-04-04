if command -v nvim &> /dev/null; then
  alias v='RBENV_VERSION=2.4.1 PYENV_VERSION=3.6.1 nvim'
else
  alias v='vim'
fi
