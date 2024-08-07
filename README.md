# Setup New Ubuntu (22.04)

Assuming KDE.

* Update packages.

* Setup system settings:
  power,
  displays,
  language (American English interface, Czech formats),
  keyboard layout switching (alt + shift)

* Install Chrome (using deb directly from its website).

* Setup terminal preferences:
  disable bell, set solarized-light scheme and palette,
  (and possibly keyboard shortcuts).

* [Generate a SSH key, add it to ssh-agent and to your GitHub account.](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

* Install git and clone this repo:

      sudo apt update
      sudo apt install git
      ln -s ~/repos/config/.gitconfig ~/.gitconfig
      mkdir repos; cd repos
      git clone https://github.com/effa/config.git

* Make links to dotfiles:

      ln -s ~/repos/config/.bash_aliases ~/.bash_aliases
      ln -s ~/repos/config/.bashrc ~/.bashrc
      ln -s ~/repos/config/.mostrc ~/.mostrc
      ln -s ~/repos/config/.XCompose ~/.XCompose

* Install vim:

      sudo apt install vim-gtk3  # for clipboard support.
      git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
      ln -s ~/repos/config/.vimrc ~/.vimrc
      vim +PluginInstall +qall

* Add custom keyboard layout:

      sudo cp ~/repos/config/xkb/te /usr/share/X11/xkb/symbols/te

* Add the following lines to `/usr/share/X11/xkb/rules/evdev.xml`.

      <layout>
        <configItem>
          <name>te</name>
          <shortDescription>tom</shortDescription>
          <description>Czech (Tom)</description>
          <languageList>
            <iso639Id>cs</iso639Id>
          </languageList>
        </configItem>
        <variantList>
        </variantList>
      </layout>

* Restart the window manager and select the Tom layout in the keyboard setting.

      systemctl restart display-manager

* Setup keybindings (see below).

* Install common Python packages:

      sudo apt install python3-pip
      pip3 install -U --user jupyter pytest networkx
      pip3 install -U --user numpy matplotlib pandas seaborn scikit-learn scipy

* Create ipython profile:

      ipython profile create
      ln -s ~/repos/config/init_ipython.py ~/.ipython/profile_default/startup/init_ipython.py

* Install LaTeX and latexmk.

      sudo apt install texlive-latex-extra latexmk
      ln -s ~/repos/config/.latexmkrc ~/.latexmkrc

* [Install Inkscape](https://wiki.inkscape.org/wiki/Installing_Inkscape) (use ppa for the latest stable version):

      sudo add-apt-repository ppa:inkscape.dev/stable
      sudo apt update
      sudo apt install inkscape
      ln -s ~/repos/config/colors.gpl ~/.config/inkscape/palettes/MyPalette.gpl


* Install [bat](https://github.com/sharkdp/bat) and setup:

      ln -s ~/repos/config/bat ~/.config/bat/config

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
