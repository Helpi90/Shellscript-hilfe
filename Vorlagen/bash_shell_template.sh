#!/bin/bash
# Author:       Craig Russell
# Email:        craig@craig-russell.co.uk
# Date:         yyyy-mm-dd
# Usage:        script.sh [-a|--alpha] [-b=val|--beta=val]
# Description:
# 
#
#

# Defaults #
A=false
B="Foo"

# Parse Parameters #
for ARG in $*; do
  case $ARG in
    -a|--alpha)
      A=true 
      ;;
    -b=*|--beta=*)
      B=${ARG#*=} 
      ;;
    *)
      echo "Unknown Argument $ARG" ;;
  esac
done

# Do Some Stuff #
echo "Usage script.sh [-a|--alpha] [-b=val|--beta=val]"
echo "A: $A"
echo "B: $B"