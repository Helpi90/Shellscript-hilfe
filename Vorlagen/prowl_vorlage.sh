#!/bin/bash
#======================================== ==================================
#     FILE:                                prowl_vorlage.sh
#     AUTHOR:                        Helpi_Stone
#     EMAIL:                             helpi9007@gmail.com
#     CREATED:                      2017-08-31
#
#     MODIFIED BY:                Defjam
#     MODIFIED DATE:           2017-08-31
#
#     DESCRIPTION:               "Example: ./prowl.sh 0 "hello world" "this is only a test""
#
#     VERSION:                        1.0
#======================================== ==================================
app="Application Name"
priority=$1
eventname=$2
description=$3
apikey=YOURAPIKEY # Replace YOURAPIKEY with your key

if [ $# -ne 3 ]; then
        echo "prowl"
        echo "Usage: ./prowl.sh priority(-2 to 2) appname description"
        echo 'Example: ./prowl.sh 0 "linux" "this is a test"'
else
        curl https://prowl.weks.net/publicapi/add -F apikey=$apikey -F priority=$priority -F application="$app" -F event="$eventname" -F description="$description"
fi
