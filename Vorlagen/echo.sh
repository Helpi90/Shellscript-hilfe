#!/bin/bash
 
echo "--------------------------------------"
echo "Script name ................... [ $0 ]"
echo "First parameter ............... [ $1 ]"
echo "Second parameter .............. [ $2 ]"
echo "Process ID .................... [ $$ ]"
echo "Parameter count ............... [ $# ]"
echo "All parameters ................ [ $@ ]"
echo "FLAGS ......................... [ $- ]"
echo "--------------------------------------"
 
# EXAMPLE OUTPUT:
# > ./shell-play-2.sh param1 param2
# --------------------------------------
# Script name ................... [ ./shell-play-2.sh ]
# First Parameter ............... [ param1 ]
# Second Parameter .............. [ param2 ]
# Process ID .................... [ 555 ]
# Parameter Count ............... [ 2 ]
# All Parameters ................ [ param1 param2 ]
# FLAGS ......................... [ hB ]
# --------------------------------------