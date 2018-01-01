# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mem_usage.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: macbook <macbook@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/30 23:53:35 by macbook           #+#    #+#              #
#    Updated: 2017/12/31 01:39:44 by macbook          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#ps -u $USER -wo rss=,comm= --sort -rss | while read -r rss comm ; do echo $((rss/1024))"MB" $comm; done
##########################################
## Ueberprüfung ob $1 und $2 gegeben sind
##########################################

if [ -z "$1" -o -z "$2" ] ;then
echo "So geht das nicht"
exit 1;
fi

#######################################
##    Prüfen, ob Host erreichbar
#######################################

ping -c 1 192.168.2.$1 &> /dev/null
if [ "$?" != 0 ] ; then
        echo "Offline" >> /var/log/openhab2/restart.log 2>&1
        exit 1;
fi

command="ps --user 1000 -wo rss=,comm= --sort -rss"

ps=$(/usr/bin/ssh -i /scripts/.ssh/id_rsa root@192.168.2.$1 "$command")
# ZEILE 1
pscmd=$(echo $ps | cut -d ' ' -f2)
psmem=$(echo $ps | cut -d ' ' -f1)
mem1=$(echo $((psmem/1024)))
psmem=$(echo $((psmem/1024))"MB")

zeile1="$pscmd = $psmem"
# ZEILE 2
pscmd=$(echo $ps | cut -d ' ' -f4)
psmem=$(echo $ps | cut -d ' ' -f3)
mem2=$(echo $((psmem/1024)))
psmem=$(echo $((psmem/1024))"MB")

zeile2="$pscmd = $psmem"
# ZEILE 3
pscmd=$(echo $ps | cut -d ' ' -f6)
psmem=$(echo $ps | cut -d ' ' -f5)
mem3=$(echo $((psmem/1024)))
psmem=$(echo $((psmem/1024))"MB")

zeile3="$pscmd = $psmem"
# ZEILE 4
pscmd=$(echo $ps | cut -d ' ' -f8)
psmem=$(echo $ps | cut -d ' ' -f7)
mem4=$(echo $((psmem/1024)))
psmem=$(echo $((psmem/1024))"MB")

zeile4="$pscmd = $psmem"
# ZEILE 5
pscmd=$(echo $ps | cut -d ' ' -f10)
psmem=$(echo $ps | cut -d ' ' -f9)
mem5=$(echo $((psmem/1024)))
psmem=$(echo $((psmem/1024))"MB")

zeile5="$pscmd = $psmem"
# Zusammen zählen
gesamt=$(echo $((mem1+mem2+mem3+mem4+mem5)))
# AUSGABE ZEILEN
if [ "$2" = "1" ]; then
	echo $zeile1
elif [ "$2" = "2" ]; then
	echo $zeile2
elif [ "$2" = "3" ]; then
	echo $zeile3
elif [ "$2" = "4" ]; then
	echo $zeile4
elif [ "$2" = "5" ]; then
	echo $zeile5
elif [ "$2" = "gesamt" ]; then
	echo $gesamt
fi

