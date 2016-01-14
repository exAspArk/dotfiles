install_ansible:
	sudo easy_install pip
	sudo pip install ansible

install_homebrew:
	ansible-playbook ansible/homebrew.yml -i ansible/local -vv -e curdir=$(CURDIR)

install_homebrew_apps:
	ansible-playbook ansible/homebrew_apps.yml -i ansible/local -vv -e curdir=$(CURDIR)

install_oh_my_zsh:
	ansible-playbook ansible/oh_my_zsh.yml -i ansible/local -vv -e curdir=$(CURDIR)

configure_vim:
	ansible-playbook ansible/vim.yml -i ansible/local -vv -e curdir=$(CURDIR)

configure_dotfiles:
	ansible-playbook ansible/dotfiles.yml -i ansible/local -vv -e curdir=$(CURDIR)
