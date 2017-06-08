# display
alias hdmi-only='xrandr --output eDP1 --off --output HDMI1 --auto'
alias monitor-on='xrandr --output eDP1 --auto'
alias monitor-on-right='xrandr --output eDP1 --auto --right-of HDMI1'
alias projector-clone='xrandr --output VGA1 --auto --same-as eDP1'
alias projector-right-of='xrandr --output VGA1 --auto --right-of eDP1'
alias projector-off='xrandr --output VGA1 --off'

# todo list
#alias todo='vim ~/documents/plany/TODO'
#alias nowtodo='vim TODO'

# projects
alias mkvirtualenv2='mkvirtualenv --python /usr/bin/python2.7'
#alias jump='cd ~/gdrive/projects/ && cd'

# git
alias glog='git log --graph --oneline --decorate --all'

# printing
alias tisk='lpr -P HP_LaserJet_1018'
# options:
# -P copy5c-duplex
# -o PageSize=A4 -o fit-to-page
# -o KCStaple=Upperleft

# system commands
alias euclid-shutdown='systemctl poweroff'
alias euclid-suspend='i3lock && sleep 1 && systemctl suspend'
alias euclid-hibernate='i3lock && sleep 1 && systemctl hibernate'
alias euclid-reboot='systemctl reboot'
alias euclid-logout='i3-msg exit'
alias euclid-lock='i3lock -d -c 000000'

# remote access
alias ssh-aurora='ssh xeffenb1@aurora.fi.muni.cz'
alias ssh-aisa='ssh xeffenb1@aisa.fi.muni.cz'
alias ssh-belos='ssh xeffenb1@belos.fi.muni.cz'
#alias mount-aurora='sshfs xeffenb1@aurora.fi.muni.cz:/home/xeffenb1 /home/tom/aurora-home'
#alias unmount-aurora='fusermount -u ~/aurora-home'
#alias lazy-unmount-aurora='sudo umount -l ~/aurora-home'

# time
alias set-fi-time='sudo ntpdate -u time.fi.muni.cz'

# audio split
alias audio-split='mp3splt -f -t 7.0 -o @f_@n -d parts'
