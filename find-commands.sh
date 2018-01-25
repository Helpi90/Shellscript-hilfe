#!/bin/bash
###
# Filename:          find-commands.sh
# Project:           Shellscript-hilfe
# Author:            macbook 
# -----
# File Created:      20-01-2018
# -----
# Last Modified:     20-01-2018
# Modified By:       macbook 
# -----
###


# Look for certain files then get the size of everithng finding on current dir
find . -name "*lua*" -type f -exec du -ch {} + | grep total$

# Look for files with a patron on a current dir
find . -name "*lua*" -type f 

# Delete all files find them with a patron
find . -name "*lua*" -type f -delete