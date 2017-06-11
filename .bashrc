# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:$HOME/bin:$HOME/.npm-global/bin:/root/.gem/ruby/2.3.0/bin:$HOME/.gem/ruby/2.3.0/bin



# vim as default editor
export EDITOR="vim"
export VISUAL="vim"

# color support of ls, grep, fgrep and egrep
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

## some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

# load bash aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# append to the history file, don't overwrite it
shopt -s histappend

# size of stored history
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# space expansion magic
# e.g. !echo<space> expands to the last command starting with "echo"
bind Space:magic-space

## Haskell
#if [ -d "$HOME/.cabal/bin" ]; then
#    PATH="$HOME/.cabal/bin:$PATH"
#    export PATH
#fi

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/gdrive/projects
source /usr/bin/virtualenvwrapper.sh

#__GIT_STATUS='$(es=$?;__git_ps1|sed "s/ \(.\+\)/\1 /";exit $es)'
#_RETVAL='$(es=$?; if [ $es -ne 0 ]; then echo "$es "; fi)'
#PS1="[\u@\h \W] ${_GIT_STATUS}${_RETVAL}\$ "
# NOTE: user, pc and full path are shown in window title bar
source /usr/share/git/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\W$(__git_ps1 ":%s")\$ '
# prompt settings
#PS1='[\u@\h \W]\$ '
#. ~/.liquidprompt/liquidprompt
#. liquidprompt
