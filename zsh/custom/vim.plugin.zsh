if command -v nvim &> /dev/null; then
  alias v='PYENV_VERSION=3.6.1 nvim'
else
  alias v='vim'
fi
