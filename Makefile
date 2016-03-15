install_ansible:
	sudo easy_install pip
	sudo pip install ansible

install_homebrew:
	ansible-playbook ansible/install_homebrew.yml -i ansible/local -vv -e curdir=$(CURDIR)

install_homebrew_apps:
	ansible-playbook ansible/install_homebrew_apps.yml -i ansible/local -vv -e curdir=$(CURDIR)

install_oh_my_zsh:
	ansible-playbook ansible/install_oh_my_zsh.yml -i ansible/local -vv -e curdir=$(CURDIR)

install_homebrew_cask_apps:
	ansible-playbook ansible/install_homebrew_cask_apps.yml -i ansible/local -vv -e curdir=$(CURDIR)

configure_vim:
	ansible-playbook ansible/configure_vim.yml -i ansible/local -vv -e curdir=$(CURDIR)

configure_dotfiles:
	ansible-playbook ansible/configure_dotfiles.yml -i ansible/local -vv -e curdir=$(CURDIR) --ask-become-pass
