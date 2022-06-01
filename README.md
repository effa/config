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
        ln -s ~/repos/config/.latexmkrc ~/.latexmkrc

* Install pip, pipenv, and some useful Python packages:

        sudo apt install python3-pip python3-tk
        pip3 install -U --user pipenv pytest jupyter ipywidgets Pillow networkx
        pip3 install -U --user numpy matplotlib pandas seaborn scikit-learn scipy
        ln -s ~/repos/config/init_ipython.py ~/.ipython/profile_default/startup/init_ipython.py

* Install vim and gvim:

        sudo apt install vim-gnome   # Necessary for the clipboard support.
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall

* Install various utilities:

        sudo apt install gnome-screensaver  # Locking screen in a terminal.
        sudo apt install gnome-shell-extensions  # Also installs gnome-tweaks.

* Setup keybindings (see below).
* Use Gnome Tweaks to set up start-up apps: Chrome.
* Generate SSH keys.

* Install LaTeX and latexmk.

        sudo apt install texlive-latex-extra latexmk

* Install Inkscape and configure it.

        ln -s ~/repos/config/colors.gpl ~/.config/inkscape/palettes/MyPalette.gpl


# Python

* Create new environment and install its dependencies:

        pipenv install jupyter

* Run jupyter or any script within the environment:

        pipenv run jupyter notebook

# Vim

Random tips (also see .vimrc):
* `[normal] q: / q?` list previously executed commands / searches (and execute a new one)
* `[insert] ctrl-r` list snippets (e.g. "item", "enum")
* `:%s//something new/g` replace using the last regex


# LaTeX

* Build a PDF and watch for changes (*preview continuously*):

        latexmk -pvc -quiet [somefile.tex]  # or use `pdf` alias

 * Clean all generated files:

        latexmk -CA -bibtex

# Printing

	lpr -P copy5c-duplex
	lpr -P copy5c-duplex -o PageSize=A4 -o fit-to-page

# Keybindings

Keys | Action
--- | ---
**Super+**            | **Windows (and system)**
Super+Enter           | Run command
Super+Space           | Switch language
Super+A               | Show Apps Menu
Super+1-4             | Move to workspace 1-4
Super+PgDown/Up       | Move to workspace below/above
Super+Shift+1-4       | Move window to workspace 1-4
Super+Shift+PgDown/Up | Move window to workspace below/above
Super+Tab             | Switch between windows
Super+Shift+Q         | Close window
Super+Arrows          | Maximize / Unmaximize / Fill left / Fill right
Super+F               | Toggle Full screen mode
Super+M               | Move window
Super+R               | Resize window
Super+Z               | Toggle Zoom mode
Super+Shift+(+/-)     | Zoom in/out (only in Zoom mode)
Super+N               | Show notification panel (includes calendar)
Super+Shift+N         | Show active notification
**Ctrl+Alt+**         | **Apps (and system)**
Ctrl+Alt+L            | Lock Screen
Ctrl+Alt+T            | terminal
Ctrl+Alt+W            | web browser
Ctrl+Alt+C            | calculator
Ctrl+Alt+I            | ipython (calculator++)
Ctrl+Alt+Q            | search (query)
Ctrl+Alt+S            | settings
Ctrl+Alt+H            | help
Print                 | Copy a screenshot of selected area
Ctrl+Alt+Print        | Save screenshot of selected area
**Ctrl+**             | **App-specific**
Ctrl+Shift+(+/-/0)    | Zoom content in/out/default
**Alt+**              | **App-specific**
Alt+1-9               | Switch tabs

See [exported keybindings](keybindings.dconf).
To import or export keybindings:

    dconf dump /org/gnome/desktop/wm/keybindings/ > keybindings.dconf
    dconf load /org/gnome/desktop/wm/keybindings/ < keybindings.dconf

Use Gnome Tweaks (Keyboard > Additional Keyboard Layouts) to set:
* non-breakable space: shift + space
* switch language: alt + shift
