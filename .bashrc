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

export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
source /usr/local/bin/virtualenvwrapper.sh
