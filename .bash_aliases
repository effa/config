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
#alias euclid-shutdown='systemctl poweroff'
#alias euclid-suspend='i3lock && sleep 1 && systemctl suspend'
#alias euclid-hibernate='i3lock && sleep 1 && systemctl hibernate'
#alias euclid-reboot='systemctl reboot'
#alias euclid-logout='i3-msg exit'
#alias euclid-lock='i3lock -d -c 000000'

# Remote access
alias ssh-aisa='ssh xeffenb1@aisa.fi.muni.cz'
alias ssh-belos='ssh xeffenb1@belos.fi.muni.cz'
alias ssh-al='ssh effa@al.thran.cz'

# Other
alias set-fi-time='sudo ntpdate -u time.fi.muni.cz'
alias glog='git log --graph --oneline --decorate --all'
alias audio-split='mp3splt -f -t 7.0 -o @f_@n -d parts'
