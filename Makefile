install_essential:
	sudo pip3 install ansible
	make play PLAYBOOK=ansible/install_essential.yml

install_cli_apps:
	make play PLAYBOOK=ansible/install_cli_apps.yml

install_gui_apps:
	make play PLAYBOOK=ansible/install_gui_apps.yml

configure_ruby:
	make play PLAYBOOK=ansible/configure_ruby.yml OPTIONS="--ask-become-pass --extra-vars='version=$(VERSION)'"

configure_node:
	make play PLAYBOOK=ansible/configure_node.yml OPTIONS="--extra-vars='version=$(VERSION)'"

configure_elixir:
	make play PLAYBOOK=ansible/configure_elixir.yml OPTIONS="--extra-vars='version=$(VERSION) otp=$(OTP)'"

configure_python:
	make play PLAYBOOK=ansible/configure_python.yml OPTIONS="--extra-vars='version=$(VERSION)'"

configure_java:
	make play PLAYBOOK=ansible/configure_java.yml OPTIONS="--extra-vars='version=$(VERSION)'"

configure_vim:
	make play PLAYBOOK=ansible/configure_vim.yml

configure_dotfiles:
	make play PLAYBOOK=ansible/configure_dotfiles.yml OPTIONS=--ask-become-pass

configure_backups:
	make play PLAYBOOK=ansible/configure_backups.yml OPTIONS=--ask-become-pass

play:
	ansible-playbook $(PLAYBOOK) -i ansible/local -vv -e curdir=$(CURDIR) $(OPTIONS)
