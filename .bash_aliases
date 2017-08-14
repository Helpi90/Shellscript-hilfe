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
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
skript () { touch $1.sh && chmod +x $1.sh && nano $1.sh; }     # skript         Erstellt eine Datei, führt chmod +x aus und öffnet nano

# 'easy extract'
extract () {
  if [ -f "$1" ] ; then
  case $1 in
    *.tar.bz2)   tar xjf "$1"     ;;
    *.tar.gz)    tar xzf "$1"     ;;
    *.bz2)       bunzip2 "$1"     ;;
    *.rar)       unrar e "$1"     ;;
    *.gz)        gunzip "$1"      ;;
    *.tar)       tar xf "$1"      ;;
    *.tbz2)      tar xjf "$1"     ;;
    *.tgz)       tar xzf "$1"     ;;
    *.zip)       unzip "$1"       ;;
    *.Z)         uncompress "$1"  ;;
    *.7z)        7z x "$1"        ;;
    *)     echo "'$1' cannot be extracted via extract()" ;;
  esac
  else
    echo "'$1' is not a valid file"
  fi
}

function syslog() {
  tail -f /var/log/system.log
}

# checks port number to see what service is attached
function port2service() {
  lsof -i -P | grep "$1"
}

#alias grep='grep --color=auto -in'

# get rid of command not found
alias cd..='cd ..'

# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

# show hidden files only
alias ls.='ls -d .* --color=auto'

# show extra options
alias dir='ls -alv'

# go to directory and execute 'ls'
function cdl() {
    if [ "$*" = "" ]
    then
        cd
    else
        cd "$*";
    fi
        dir;
}
