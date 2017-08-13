# aliases for directory traversal
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias gohome="cd ~"
alias helpi="cd /home/helpi"
alias pi="cd /home/pi"
alias cdd="cd - > /dev/null"

# GitHub commandos
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

alias update="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y "

alias logoh="tail -f /var/log/openhab2/openhab.log -f /var/log/openhab2/events.log"
alias mkdir="mkdir -p"
alias wget="wget -c"
alias mv="mv -i"
alias rd="rmdir"

# ls
alias ls="ls --color -h --group-directories-first -I '*.pyc' -I '__*__'"
alias ll='ls -alF'
alias l="ls -l"
alias lszeigen="ls -lh" # Dateien + Rechte + Größe

# Gibt die Größen der Ordner an
alias getsize="du -hc -d 0 `ls -trx --hide=log | tr '\n' ' '` | sh"

alias tarzeigen="tar -ztvf"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Borg Backup
alias borg_check="sudo borg check" # borg check /pfad/zum/repo
alias borg_list="sudo borg list" # borg list /pfad/zum/repo
alias borg_mount="sudo borg mount" # borg mount /pfad/zum/repo /mnt/repo
alias borg_prune="sudo borg prune –dry-run –keep-daily=7 –keep-weekly=4" # + /pfad/zum/repo
alias borg_info="sudo borg info" # borg info /pfad/zum/repo::ARCHIV


# Zip
alias makezip="/usr/bin/zip -rq "  # /usr/bin/zip -rq /backup/test_`date "+%Y-%m-%d"`.zip ./
