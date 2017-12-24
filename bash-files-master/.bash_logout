##  ------------------------------------------------------------------------  ##
##     ~/.bash_logout: executed by bash(1) when login shell exits.            ##
##  ------------------------------------------------------------------------  ##

# when leaving the console, clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
  [ -x /usr/bin/clear ] && /usr/bin/clear -q
fi

echo -e "Hasta la vista, ${BYellow}$USER${NC}";