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

while [ "$#" -gt 0 ]
do
	case $1 in
	-h | --help)
		echo "Show program help for $(basename $0)"
		shift
		;;
	-l | --list)
		echo "List the options"
		shift
		;;
	*)  
		echo "Other options"
		shift
		;;
	esac
done