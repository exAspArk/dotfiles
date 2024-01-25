# dotfiles

## Demo

<a href="https://www.youtube.com/watch?v=XqWLLvihz4Q" align="center"><img src="./img/thumbnail.png" alt="Demo" height="316px" width="560px" ></a>

## Requrements

* Git

## Install

```
# Install Dropbox

mkdir ~/.ssh
cp $BACKUP_PATH/ssh/* ~/.ssh
chmod 600 ~/.ssh/id_rsa

mkdir -p $PROJECT_PATH/my
cd $PROJECT_PATH/my
git clone git@github.com:exAspArk/dotfiles.git

xcode-select --install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
sh <(curl -L https://nixos.org/nix/install)
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer && ./result/bin/darwin-installer && rm -rf ./result

export PATH=$PATH:/opt/homebrew/bin
make install_cli_apps
make install_gui_apps
make configure_dotfiles
make configure_backups

pip3 install --upgrade neovim pynvim
gem install neovim solargraph gem-ctags ripper-tags
pnpm add -g livedown neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vimcurl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall! +qall
cd ~/.vim/plugged/coc.nvim && pnpm install
cd ~/.config/coc/extensions && pnpm install
git clone https://github.com/elixir-lsp/elixir-ls.git ~/.config/coc/elixir-ls
cd ~/.config/coc/elixir-ls && mix deps.get && mix compile && mix elixir_ls.release -o release
```

Set up [GPG](https://gist.github.com/exAspArk/d5cffe82f3151c40669be1aa4122e952#method-2) by using Method 2.

## Other tools and apps:

* pCloud
* Typora
* OBS
* Grammarly Desktop
