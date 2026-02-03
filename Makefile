install_cli_apps:
	brew tap "codebreakdown/homebrew-oss" && brew install codebreakdown/oss/alt # https://github.com/uptech/alt
	brew install stats # internet speed and usage https://github.com/exelban/stats
	brew install libyaml # for 'psych' gem
	brew install libpq # for 'pg' gem
	brew install go-parquet-tools # parquet file tools
	brew install ollama
	curl https://raw.githubusercontent.com/exAspArk/sshrc/master/sshrc -o ~/Downloads/sshrc && chmod +x ~/Downloads/sshrc && sudo mkdir -p /usr/local/bin && sudo mv ~/Downloads/sshrc /usr/local/bin/sshrc

	ln -sf $(PWD)/nixpkgs/darwin-configuration.nix ~/.nixpkgs/darwin-configuration.nix
	# https://channels.nixos.org/
	sudo nix-channel --add https://nixos.org/channels/nixpkgs-25.05-darwin nixpkgs
	# https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#step-2-adding-nix-darwin-channel
	sudo nix-channel --add https://github.com/nix-darwin/nix-darwin/archive/nix-darwin-25.05.tar.gz darwin
	sudo nix-channel --update
	ninstall

	ln -sf /run/current-system/sw/bin/sed /opt/homebrew/bin/gsed # for Spectre nvim plugin to avoid 'brew install gnu-sed'
	defaults write com.apple.Finder AppleShowAllFiles true && killall Finder
	defaults write -g KeyRepeat -int 1 # faster repeat time requires a restart
	defaults write com.apple.screencapture show-thumbnail -bool false
	curl https://repo1.maven.org/maven2/org/apache/avro/avro-tools/1.12.0/avro-tools-1.12.0.jar -o ~/.config/avro-tools.jar # https://mvnrepository.com/artifact/org.apache.avro/avro-tools
	pnpm install -g @anthropic-ai/claude-code
	pnpm install -g @google/gemini-cli
	pnpm install -g @openai/codex@latest
	pnpm install -g @github/copilot

install_gui_apps:
	brew install --cask keepassxc
	brew install --cask kitty
	brew install --cask obsidian
	brew install --cask bartender
	brew install --cask betterdisplay # fix macOS Ventura display scale bug with HiDPI
	brew install --cask docker
	brew install --cask gpg-suite
	brew install --cask bruno # UI API client
	brew install --cask karabiner-elements
	brew install --cask licecap # record gifs from screen
	brew install --cask ngrok
	# brew install --cask osxfuse
	brew install --cask qbittorrent # "scutil --nwi" to use VPN interface (advanced settings)
	brew install --cask raycast
	brew install --cask sourcetree
	brew install --cask syncthing
	brew install --cask tableplus # sql GUI vs psequel
	brew install --cask the-unarchiver
	brew install --cask zoom
	brew install --cask loom
	brew install --cask espanso
	brew install --cask slack
	brew install --cask discord
	brew install --cask figma
	brew install --cask cyberduck
	brew install --cask webtorrent
	brew install --cask tad
	brew install --cask lm-studio
	brew install --cask linphone
	# brew install --cask paragon-ntfs
	mas install 'Elmedia Video Player'
	mas install Flycut
	mas install Keynote
	mas install Polarr
	mas install 'Canary Mail'
	mas install 'VPN Unlimited'
	mas install WhatsApp
	mas install Xcode
	mas install Moom # paid
	mas install LocalSend
	mas install WireGuard
	mas install Brave
	mas install 'Whisper Transcription'

configure_dotfiles:
	sudo rm -rf /etc/zprofile
	mkdir -p ~/.bundle
	mkdir -p ~/.zsh/custom
	mkdir -p ~/.gnupg
	mkdir -p ~/.config
	mkdir -p ~/.config/coc/extensions
	mkdir -p ~/.config/nvim/lua/config
	mkdir -p ~/.config/kitty
	mkdir -p ~/.config/karabiner
	mkdir -p ~/.vim/undo
	mkdir -p ~/.vim/autoload
	ln -sf $(PWD)/bundle/config ~/.bundle/config
	ln -sf $(PWD)/gemini/settings.json ~/.gemini/settings.json
	ln -sf $(PWD)/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
	ln -sf $(PWD)/nvim/lua/config/ale.lua ~/.config/nvim/lua/config/ale.lua
	ln -sf $(PWD)/nvim/lua/config/bufferline.lua ~/.config/nvim/lua/config/bufferline.lua
	ln -sf $(PWD)/nvim/lua/config/coc.lua ~/.config/nvim/lua/config/coc.lua
	ln -sf $(PWD)/nvim/lua/config/ctrlsf.lua ~/.config/nvim/lua/config/ctrlsf.lua
	ln -sf $(PWD)/nvim/lua/config/lazy.lua ~/.config/nvim/lua/config/lazy.lua
	ln -sf $(PWD)/nvim/lua/config/lualine.lua ~/.config/nvim/lua/config/lualine.lua
	ln -sf $(PWD)/nvim/lua/config/indent-blankline.lua ~/.config/nvim/lua/config/indent-blankline.lua
	ln -sf $(PWD)/nvim/lua/config/nvim-spectre.lua ~/.config/nvim/lua/config/nvim-spectre.lua
	ln -sf $(PWD)/nvim/lua/config/nvim-tree.lua ~/.config/nvim/lua/config/nvim-tree.lua
	ln -sf $(PWD)/nvim/lua/config/nvim-treesitter.lua ~/.config/nvim/lua/config/nvim-treesitter.lua
	ln -sf $(PWD)/nvim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua
	ln -sf $(PWD)/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
	ln -sf $(PWD)/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json
	ln -sf $(PWD)/zsh/custom/aliases.zsh ~/.sshrc.d/aliases.zsh
	ln -sf $(PWD)/zsh/custom/aliases.zsh ~/.zsh/custom/aliases.zsh
	ln -sf $(PWD)/zsh/themes/exaspark.zsh-theme ~/.oh-my-zsh/themes/exaspark.zsh-theme
	ln -sf $(PWD)/asdfrc ~/.asdfrc
	ln -sf $(PWD)/coc-package.json ~/.config/coc/extensions/package.json
	ln -sf $(PWD)/npmrc ~/.npmrc
	ln -sf $(PWD)/gemrc ~/.gemrc
	ln -sf $(PWD)/gitconfig ~/.gitconfig
	ln -sf $(PWD)/gitignore ~/.gitignore
	ln -sf $(PWD)/iex.exs ~/.iex.exs
	ln -sf $(PWD)/irbrc ~/.irbrc
	ln -sf $(PWD)/irbrc ~/.sshrc.d/irbrc
	ln -sf $(PWD)/kitty/kitty.conf ~/.config/kitty/kitty.conf
	ln -sf $(PWD)/pryrc ~/.pryrc
	ln -sf $(PWD)/rubocop.yml ~/.rubocop.yml
	ln -sf $(PWD)/sshrc ~/.sshrc
	ln -sf $(PWD)/tern-project ~/.tern-project
	ln -sf $(PWD)/vimrc ~/.config/nvim/init.vim
	ln -sf $(PWD)/vimrc ~/.sshrc.d/vimrc
	ln -sf $(PWD)/vimrc ~/.vimrc
	ln -sf $(PWD)/zshenv ~/.zshenv
	ln -sf $(PWD)/zshrc ~/.zshrc
	ln -sf $(PWD)/espanso/kitty.yml ~/Library/Application\ Support/espanso/config/kitty.yml
	ln -sf $BACKUP_PATH/espanso-matches.yml ~/Library/Application\ Support/espanso/match/base.yml
	ln -sf $BACKUP_PATH/karabiner.json ~/.config/karabiner/karabiner.json
	ln -sf $BACKUP_PATH/ssh/config ~/.ssh/config
	ln -sf $BACKUP_PATH/aws/config ~/.aws/config
	mkdir -p ~/.local/share/terminfo/x
	ln -sf /Applications/kitty.app/Contents/Resources/kitty/terminfo/78/xterm-kitty ~/.sshrc.d/xterm-kitty
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

configure_backups:
	(crontab -l ; echo "0 * * * * cp ~/.zsh_history $(BACKUP_PATH)/zsh_history") | sort - | uniq - | crontab -
