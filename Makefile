install:
	setup-git
	setup-vim
	ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
	ln -s ~/dotfiles/.bashrc ~/.bashrc
	ln -s ~/dotfiles/.xprofile ~/.xprofile

setup-git:
	ln -s ~/dotfiles/.gitconfig ~/.gitconfig

setup-vim:
	ln -s ~/dotfiles/.vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	# + set solarized colorscheme (gnome-terminal>profile>colors>pallete)
