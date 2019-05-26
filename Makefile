install_essential:
	sudo easy_install pip
	sudo pip install ansible
	make play PLAYBOOK=ansible/install_essential.yml

install_homebrew_apps:
	make play PLAYBOOK=ansible/install_homebrew_apps.yml

install_homebrew_cask_apps:
	make play PLAYBOOK=ansible/install_homebrew_cask_apps.yml

configure_ruby:
	make play PLAYBOOK=ansible/configure_ruby.yml OPTIONS="--ask-become-pass --extra-vars='ruby_version=$(RUBY_VERSION)'"

configure_python:
	make play PLAYBOOK=ansible/configure_python.yml OPTIONS="--ask-become-pass --extra-vars='python_version=$(PYTHON_VERSION)'"
install_new_ansible:
	make play PLAYBOOK=ansible/install_new_ansible.yml OPTIONS="--ask-become-pass --extra-vars='python_version=$(PYTHON_VERSION)'"

configure_vim:
	make play PLAYBOOK=ansible/configure_vim.yml

configure_dotfiles:
	make play PLAYBOOK=ansible/configure_dotfiles.yml OPTIONS=--ask-become-pass

configure_backups:
	make play PLAYBOOK=ansible/configure_backups.yml OPTIONS=--ask-become-pass

play:
	ansible-playbook $(PLAYBOOK) -i ansible/local -vv -e curdir=$(CURDIR) $(OPTIONS)
