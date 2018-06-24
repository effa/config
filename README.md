# Setup New Ubuntu (18.04)
       
* Install git
* Clone this repository
* Install pip and pipenv    
        
        sudo apt update
        sudo apt install python3-pip
        pip3 install --user pipenv
        echo "PATH=$HOME/.local/bin:$PATH" >> ~/.bashrc
        source ~/.bashrc
        
* Install vim
* Make links to dotfiles
* Setup keyboard shortcuts
* Install LaTeX


# Python
       
* Create new environment and install its dependencies:   
        
        pipenv install jupyter
        
* Active an existing environment and run jupyter:   
        
        pipenv shell
        jupyter notebook
        # ----- or -----
        pipenv run jupyter notebook
        
        
 
# LaTeX
       
* Build a PDF and watch for changes (*preview continuously*):   
        
        latexmk -pdf -pvc -quiet somefile.tex
  
 * Clean all generated files: 
        
        latexmk -CA -bibtex
