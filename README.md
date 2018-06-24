# Setup New Ubuntu (18.04)

* Setup system settings:
  dock, power, displays, keyboard shortcuts,
  language (set UK formats, add Czech input source),
  add Google account.
  
* Setup terminal preferences:
  disable bell, sett solarized-light scheme and palette,
  (and possibly keyboard shortcuts).  

* Install git:

       sudo apt update
       sudo apt install git

* Clone this repository:

       ~$ mkdir repos; cd repos
       ~/repos$ git clone https://github.com/effa/config.git      
         
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
        
* Install vim:

        sudo apt install vim

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
