# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Path
export PATH=$PATH:/home/tom/.local/bin

# NeoVim as default editor.
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="most"
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Load bash aliases.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Set history behavior and size.
shopt -s histappend # Append to the history file, don't overwrite it.
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

# TAB completion:
# Complete the first match, then cycle throug the others.
bind "TAB:menu-complete"
# But still show the list of all matches.
bind "set show-all-if-ambiguous on"
# First tab to only complete the common prefix.
bind "set menu-complete-display-prefix on"

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
scp-umime-lab() { scp "$1" umimetoorg@umimeto.org:ftp/umimefakta.cz/webroot/admxtrs/tomeff/labs; }

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
  __conda_setup="$('/home/tom/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
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

workon-analysis() {
  cd "/home/tom/repos/analysis"
  source .venv/bin/activate
}

workon-content() {
  cd "/home/tom/repos/content"
  source .venv/bin/activate
  # hack to make umistats available, better solution would be to install it into the venv
  export PYTHONPATH=/home/tom/repos/analysis:$PYTHONPATH
}

workon-rcmd() {
  cd "/home/tom/repos/web/web-central/admxtrs/cron/system/ps_relations"
  systemctl --user start docker-desktop
  # Wait for Docker Desktop service to be active
  if ! timeout 30s bash -c 'until systemctl --user is-active --quiet docker-desktop; do sleep 0.5; done'; then
    echo "❌ docker-desktop service didn’t become active in 30s." >&2
    return 1
  fi
  # 2) Wait for Docker engine to be ready
  if ! timeout 30s bash -c 'until docker info >/dev/null 2>&1; do sleep 0.5; done'; then
    echo "❌ Docker engine not ready in 30s." >&2
    return 1
  fi
  docker compose up -d db
  mrm dev.py
}

workon-progressbar() {
  cd "/home/tom/repos/progressbar"
  source .venv/bin/activate
}

mrm() {
  uv run marimo edit --host 127.0.0.1 --port 2718 --headless --no-token "$@" &
  local pid=$!
  until curl -fsS http://127.0.0.1:2718 >/dev/null 2>&1; do sleep 0.2; done
  chrome --app="http://127.0.0.1:2718"
  wait $pid
}

# workon-stapler() {
#   cd "/home/tom/repos/stapler"
#   source .venv/bin/activate
#
#   export VITE_SERVER=http://192.168.50.10:8000 # kvůli technickým důvodům musí být stejné jako servername
#   export SERVERNAME="http://192.168.50.10:8000"
#   export SSID="STAPLER"
#   export PASS="umyvadlo145"
#
#   # export VITE_SERVER=http://localhost:8000 # kvůli technickým důvodům musí být stejné jako servername
#   # export SERVERNAME="http://localhost:8000"
#   # export SSID="Hrnek"
#   # export PASS="umyvadlo145"
# }

#audio-length() {
#  mp3info -p '%S\n' *.mp3 | awk '{s+=$1} END {printf"%d:%02d:%02d\n",s/3600,s%3600/60,s%3600%60}'
#}

# Needed temporarily, see https://jupyter-core.readthedocs.io/en/stable/changelog.html
export JUPYTER_PLATFORM_DIRS=1

# fzf key bindings
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
# remap fzf file to alt+f since the default ctrl+t is used for tabs
bind -m emacs-standard -x '"\ef": fzf-file-widget'

# find and edit
fe() {
  local files
  files=$(fzf -m) || return 1 # -m allows multi-select
  [ -n "$files" ] && nvim $files
}

# fuzzy find folder and enter it
ff() {
  local dir
  dir=$(fd --type d --hidden --follow --exclude .git . | fzf) || return 1
  [ -n "$dir" ] && cd "$dir"
}
#alias d='fcd'
