install: install_rbenv install_swiftenv install_pyenv install_goenv
	@bash install.sh

install_rbenv:
	-git clone https://github.com/rbenv/rbenv.git ~/.rbenv
	-git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

install_swiftenv:
	-git clone https://github.com/kylef/swiftenv.git ~/.swiftenv

install_pyenv:
	-git clone https://github.com/pyenv/pyenv.git ~/.pyenv

install_goenv:
	-git clone https://github.com/kaneshin/goenv.git ~/.goenv
