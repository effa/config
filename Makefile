install:
	@echo "Follow README and think :)"

links:
	ln -s ~/repos/config/.gitconfig ~/.gitconfig
	ln -s ~/repos/config/.bash_aliases ~/.bash_aliases
	ln -s ~/repos/config/.bashrc ~/.bashrc
	ln -s ~/repos/config/.vimrc ~/.vimrc

vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
