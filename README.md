# dotfiles

## Demo

<a href="https://www.youtube.com/watch?v=XqWLLvihz4Q" align="center"><img src="./img/thumbnail.png" alt="Demo" height="316px" width="560px" ></a>

## Requrements

* Git

## Install

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

mkdir -p $PROJECT_PATH/my
cd $PROJECT_PATH/my
git clone git@github.com:exAspArk/dotfiles.git

mkdir ~/.ssh
cp $BACKUP_PATH/ssh/* ~/.ssh
chmod 600 ~/.ssh/id_rsa

make install_essential
make configure_dotfiles
make configure_vim

make configure_ruby VERSION=2.5.7
make configure_node VERSION=12.14.0
make configure_elixir VERSION=1.9.4 OTP=22
make configure_java VERSION=adopt-openjdk-8u232-b09

make install_cli_apps
make install_gui_apps

make configure_backups
```

## Other tools and apps:

### Apps

* Docker for Mac

### Google Chrome extensions

* Grammarly for Chrome
* JSON Formatter
* React Developer Tools
* Redux DevTools
* Save to Pocket
* Speed Dial 2
* uBlock Origin
* HTTPS Everywhere

### Android apps

* Adobe Acrobat Reader
* AliExpress
* Authenticator
* Bubble Level
* Calendar
* CamScanner
* cloudLibrary
* Dropbox
* Fongo
* GasBuddy
* Gmail
* GreenP
* Hoopla
* Image Edge Mobile (Sony)
* Investing
* Keepass2Android
* Libby
* Kiwi Browser
* Lite (Facebook)
* Lyft
* Maps
* MAPS.ME
* Messages
* Mint
* MobileVOIP
* Nova Settings
* Paytm
* Photos
* Pixel Icon Package
* Player FM
* Pocket
* PRESTO
* PureVPN
* Ring
* Ritual
* Roku
* Sheets
* Simplenote
* Slack
* Stack
* Stocard
* Swim Guide
* T2S
* TickTick
* Translate
* Uber
* Viber
* VLC
* Voice Recorder
* VNC Viewer
* WardenCam
* WhatsApp
* Xender
* xFi Locator
* YouTube Vanced
* Zoom
* @Voice
