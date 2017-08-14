#!/bin/bash
#========================== =======================
#
#     FILE:           		case.sh
#     PROJECT:          		Scripte
#
#     AUTHOR:           		HelpiStone
#     EMAIL:            		helpi9007@gmail.com
#     CREATED:          	14-08-2017
#
#     MODIFIED BY:      	macbook
#     MODIFIED DATE:  	14-08-2017
#
#     DESCRIPTION:   	""
#
#========================== =======================

echo "Bitte geben Sie ihren Namen ein"
read name

case "$name" in
        marc) echo Hallo, Marc
        ;;
        Werner) echo Hallo, Werner
        ;;
        *) echo "Hallo, Unbekannter!"
        ;;
esac
