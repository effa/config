# Setup New Ubuntu (18.04)

* Setup system settings:
  dock, power, displays, keyboard shortcuts,
  language (set UK formats, add Czech input source),
  add Google account. Setup terminal preferences:
  disable bell, set solarized-light scheme and palette,
  (and possibly keyboard shortcuts).

* Install git and clone this repo:

       sudo apt update
       sudo apt install git
       mkdir repos; cd repos
       git clone https://github.com/effa/config.git

* Make links to dotfiles:

        ln -s ~/repos/config/.gitconfig ~/.gitconfig
        ln -s ~/repos/config/.bash_aliases ~/.bash_aliases
        ln -s ~/repos/config/.bashrc ~/.bashrc
        ln -s ~/repos/config/.vimrc ~/.vimrc

* Install pip and pipenv:

        sudo apt install python3-pip
        pip3 install --user pipenv
        echo "PATH=$HOME/.local/bin:$PATH" >> ~/.bashrc
        source ~/.bashrc

* Install vim and gvim:

        sudo apt install vim-gnome   # Necessary for the clipboard support.
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall

* Install various utilities:

        sudo apt install gnome-screensaver  # Locking screen in a terminal.
        sudo apt install gnome-shell-extensions  # Also installs gnome-tweaks.

* Generate SSH keys
* Setup keyboard shortcuts
* Install LaTeX


# Python

* Create new environment and install its dependencies:

        pipenv install jupyter

* Run jupyter or any script within the environment:

        pipenv run jupyter notebook

# LaTeX

* Build a PDF and watch for changes (*preview continuously*):

        latexmk -pdf -pvc -quiet somefile.tex

 * Clean all generated files:

        latexmk -CA -bibtex

# Printing

	lpr -P copy5c-duplex
	lpr -P copy5c-duplex -o PageSize=A4 -o fit-to-page
