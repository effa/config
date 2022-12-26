# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Path
export PATH=$PATH:/home/tom/.local/bin

# Vim as default editor.
export EDITOR="vim"
export VISUAL="vim"

# Load bash aliases.
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# Set history behavior and size.
shopt -s histappend  # Append to the history file, don't overwrite it.
HISTSIZE=5000
HISTFILESIZE=10000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# The pattern "**" will match all files and zero or more (sub)directories.
shopt -s globstar

# Space expansion magic
# e.g. !echo<space> expands to the last command starting with "echo"
bind Space:magic-space

# Enable bash completions (including git completions if available):
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Prompt (with git branch and state):
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\W$(__git_ps1 ":%s")\$ '
#PS1='\W\$ '

# Make less more friendly for non-text input files:
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Virtualenvwrapper
#export WORKON_HOME=~/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
#source /usr/local/bin/virtualenvwrapper.sh
#source virtualenvwrapper.sh

scp-umime() { scp "$1" umimetoorg@umimeto.org:ftp/umimefakta.cz/webroot/admxtrs/tomeff; }

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/tom/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/tom/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/tom/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/tom/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<

conda-init() {
  __conda_setup="$('/home/tom/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/tom/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/home/tom/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/home/tom/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
}

# Needed temporarily, see https://jupyter-core.readthedocs.io/en/stable/changelog.html
export JUPYTER_PLATFORM_DIRS=1
