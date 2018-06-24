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

## Git
#source /usr/share/git/completion/git-prompt.sh
#export GIT_PS1_SHOWDIRTYSTATE=1

# Prompt
#PS1='\W$(__git_ps1 ":%s")\$ '
#PS1='[\u@\h \W]\$ '
PS1='\W\$ '

# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
