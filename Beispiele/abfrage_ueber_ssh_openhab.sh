#!/bin/bash
#======================================== ========================================
#
#     FILE:           			abfrage_ueber_ssh_openhab.sh
#     PROJECT:           		Scripte
#     PATH:				C:\Users\march\Google Drive\Scripte\Eigene\Muster Dateien\abfrage_ueber_ssh_openhab.sh
#     AUTHOR:              		HelpiStone
#     EMAIL:                  		helpi9007@gmail.com
#     CREATED:          		11-08-2017
#
#     MODIFIED BY:      		Helpi_Stone
#     MODIFIED DATE:  		11-08-2017
#
#     DESCRIPTION:   		""
#
#======================================== ========================================
#Eine Angabe von $1
#Pruefen, ob Suffix angegeben
if [ -z "$1" ] ;then
    echo "So geht das nicht"
    exit 1;
fi

#oder

#Bei zwei Angaben $1 und $2
#Pruefen, ob Suffix angegeben
if [ -z "$1"  -o -z "$2" ] ;then
    echo "So geht das nicht"
    exit 1;
fi

#Prüfen, ob Host erreichbar
ping -c 1 192.168.2.$1 &> /dev/null
if [ "$?" != 0 ] ; then
        echo "Offline"
        exit 1;
fi

# Verbindung mittels ssh herstellen und Laufzeit abfragen
up=$(/usr/bin/ssh -i /scripts/.ssh/id_rsa root@192.168.2.$1 "uptime -p")
