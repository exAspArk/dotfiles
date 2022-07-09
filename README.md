# dotfiles

## Demo

<a href="https://www.youtube.com/watch?v=XqWLLvihz4Q" align="center"><img src="./img/thumbnail.png" alt="Demo" height="316px" width="560px" ></a>

## Requrements

* Git

## Install

```
mkdir ~/.ssh
cp $BACKUP_PATH/ssh/* ~/.ssh
chmod 600 ~/.ssh/id_rsa

mkdir -p $PROJECT_PATH/my
cd $PROJECT_PATH/my
git clone git@github.com:exAspArk/dotfiles.git

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

make install_essential

make configure_python VERSION=3.7.3 # neovim dependency
make configure_ruby VERSION=2.5.7
make configure_node VERSION=12.14.0
make configure_elixir VERSION=1.9.4-otp-22 OTP=22.3.4.18
make configure_java VERSION=adopt-openjdk-8u232-b09

make configure_dotfiles
make configure_vim

make install_cli_apps
make install_gui_apps

make configure_backups
```

Set up [GPG](https://gist.github.com/exAspArk/d5cffe82f3151c40669be1aa4122e952#method-2).

## Other tools and apps:

* pCloud
* YubiKey Manager
