install_ansible:
	brew install ansible

configure_vim:
	ansible-playbook ansible/vim.yml -i ansible/local -vv -e curdir=$(CURDIR)

install_dotfiles:
	ansible-playbook ansible/dotfiles.yml -i ansible/local -vv -e curdir=$(CURDIR)
