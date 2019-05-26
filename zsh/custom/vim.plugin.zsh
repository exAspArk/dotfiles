if command -v nvim &> /dev/null; then
  alias v='ASDF_PYTHON_VERSION=3.7.3 nvim'
else
  alias v='vim'
fi
