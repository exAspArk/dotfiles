install_ansible:
	sudo easy_install pip
	sudo pip install ansible

install_homebrew:
	make play PLAYBOOK=ansible/install_homebrew.yml

install_homebrew_apps:
	make play PLAYBOOK=ansible/install_homebrew_apps.yml

install_oh_my_zsh:
	make play PLAYBOOK=ansible/install_oh_my_zsh.yml

install_homebrew_cask_apps:
	make play PLAYBOOK=ansible/install_homebrew_cask_apps.yml

configure_ruby:
	make play PLAYBOOK=ansible/configure_ruby.yml OPTIONS="--ask-become-pass --extra-vars='ruby_version=$(RUBY_VERSION)'"

configure_vim:
	make play PLAYBOOK=ansible/configure_vim.yml

configure_dotfiles:
	make play PLAYBOOK=ansible/configure_dotfiles.yml OPTIONS=--ask-become-pass

configure_backups:
	make play PLAYBOOK=ansible/configure_backups.yml OPTIONS=--ask-become-pass

play:
	ansible-playbook $(PLAYBOOK) -i ansible/local -vv -e curdir=$(CURDIR) $(OPTIONS)
