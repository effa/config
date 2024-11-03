# Setup New Ubuntu (24.04)

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
      mkdir repos; cd repos
      git clone https://github.com/effa/config.git
      ln -s ~/repos/config/.gitconfig ~/.gitconfig

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

* [Install Inkscape](https://wiki.inkscape.org/wiki/Installing_Inkscape) (use ppa for the latest stable version):

      sudo add-apt-repository ppa:inkscape.dev/stable
      sudo apt update
      sudo apt install inkscape
      ln -s ~/repos/config/colors.gpl ~/.config/inkscape/palettes/MyPalette.gpl

* Install LaTeX and latexmk.

      sudo apt install texlive-latex-extra latexmk
      ln -s ~/repos/config/.latexmkrc ~/.latexmkrc


* Install [bat](https://github.com/sharkdp/bat) and setup:

      ln -s ~/repos/config/bat ~/.config/bat/config
