# Display
alias hdmi-only='xrandr --output eDP1 --off --output HDMI1 --auto'
alias monitor-on='xrandr --output eDP1 --auto'
alias monitor-on-right='xrandr --output eDP1 --auto --right-of HDMI1'
alias projector-clone='xrandr --output VGA1 --auto --same-as eDP1'
alias projector-right-of='xrandr --output VGA1 --auto --right-of eDP1'
alias projector-off='xrandr --output VGA1 --off'

# Printers
alias print-home='lpr -P HP_LaserJet_1018'
alias print-copy5c='lpr -P copy5c-duplex'

## System commands
alias euclid-shutdown='systemctl poweroff'
alias euclid-suspend='systemctl suspend'
alias euclid-hibernate='systemctl hibernate'
alias euclid-reboot='systemctl reboot'
alias euclid-logout='gnome-session-quit'
alias euclid-lock='gnome-screensaver-command --lock'

# Remote access
alias ssh-aisa='ssh xeffenb1@aisa.fi.muni.cz'
alias ssh-belos='ssh xeffenb1@belos.fi.muni.cz'
alias ssh-al='ssh effa@al.thran.cz'

# Color support of ls, grep, fgrep and egrep
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls
alias la='ls -A'  # list all
alias ll='ls -alF'  # list all with details

# Alert after a command is finnished. Usage: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Other
alias set-fi-time='sudo ntpdate -u time.fi.muni.cz'
alias glog='git log --graph --oneline --decorate --all'
alias audio-split='mp3splt -f -t 7.0 -o @f_@n -d parts'
