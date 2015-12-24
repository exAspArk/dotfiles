install_homebrew:
	ansible-playbook ansible/homebrew.yml -i ansible/local -vv -e curdir=$(CURDIR)

install_homebrew_apps:
	ansible-playbook ansible/homebrew_apps.yml -i ansible/local -vv -e curdir=$(CURDIR)

configure_vim:
	ansible-playbook ansible/vim.yml -i ansible/local -vv -e curdir=$(CURDIR)

install_dotfiles:
	ansible-playbook ansible/dotfiles.yml -i ansible/local -vv -e curdir=$(CURDIR)
