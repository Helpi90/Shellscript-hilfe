# Beispiele
#
#######################################
##	Host und Eingabe prüfen	     ##
#######################################
#Pruefen, ob Suffix angegeben
if [ -z "$1" ] ;then
    echo "So geht das nicht"
    exit 1;
fi

#Prüfen, ob Host erreichbar
ping -c 1 192.168.2.$1 &> /dev/null
if [ "$?" != 0 ] ; then
        echo "Offline"
        exit 1;
fi
#######################################
##	Uptime	     ##
#######################################
# Verbindung mittels ssh herstellen und Laufzeit abfragen
up=$(/usr/bin/ssh -i /scripts/.ssh/id_rsa root@192.168.2.$1 "uptime -p")


# Ausgabe von Uptime in Deutsch umwandeln.
echo $up | sed 's/up //g' | sed 's/, / /g' | sed 's/days/Tage/g' | sed 's/day/Tag/g' | sed 's/hours/Stunden/g' | sed 's/hour/Stunde/g' | sed 's/minutes/Minuten/g' | sed 's/minute/Minute/g'
#######################################
##	Root User?	     ##
#######################################
# check if the current user is root
if [[ $(/usr/bin/id -u) != "0" ]]; then
    echo -e "\nThis looks like a 'non-root' user.\nPlease switch to 'root' and run the script again.\n"
    exit
fi
#######################################
##	Prüfen ob Ordner vorhanden ist	     ##
#######################################
# Ordner test erstellen falls dieser nicht vorhanden ist
ls $backup 2>/dev/null

if [ "$?" != "0" ]; then
        mkdir $backup

fi
