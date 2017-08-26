#!/bin/bash -
#===============================================================================
#
#          FILE:  template.sh
#
#         USAGE:  ./template.sh
#
#   DESCRIPTION:
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#       COMPANY: NSAS - Network System Access Solution
#       CREATED: 12/11/2013 11:02:51 AM CET
#      REVISION:  ---
#     COPYRIGHT: Copyright (c) 2014, Michèl Pelzer - http://www.nsas.de
#
#===============================================================================
#set -x                             # Display commands and their arguments.
#set -v                             # Display shell input lines as they are read.
#set -n                             # Read commands but do not execute them.
set -o nounset                      # Treat unset variables as an error
#===============================================================================
PATH="${HOME}/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
SCRIPTNAME=$(basename $0)           # Script name
NAME=${SCRIPTNAME%%.*}              # Script name without file extension
PARAMETERNR="$#"                    # Number off parameters
CURRENTDIR=${PWD}                   # Current directory
USER=${USER}                        # Username
DATE=$(date +%d:%m:%Y-%T)           # Date string
HOST=$(hostname)                    # System host name
DOMAIN=$(hostname -d)               # Domain name
ERROR="0"                           # Reset error counter
LOGFILE="${NAME}.log"               # Default log file
QUIET="false"                       # Default logging is enabled
LANG=en_US.UTF-8                    # Define default Language set
EMAIL="${USER}@${DOMAIN}"           # Reporting Email
CONFIGFILE="/etc/default/${NAME}"   # Default config file will be sourced
PID=$$                              # Current running prossess ID
SCRATCH=/tmp/${PID}.scratch         # Scratch directory (temp directory)
#===============================================================================
# Write your code here. (in function main)
#===============================================================================
function main() {
    TAG=${FUNCNAME[0]}
    log "[I] [${TAG}]"
    #######################
    #                     #
    # YOUR CODE GOES HERE #
    #                     #
    #######################
    return 0
}
# Do not edit below
#===============================================================================
# Help function
#===============================================================================
function usage() {
    TAG=${FUNCNAME[0]}
    echo "
    Usage: ${SCRIPTNAME} [options]

        -d           optional  Enables debug (set -x)
        -h           optional  Print this help message
        -q           optional  Suppress log messages on screen, just log them.
    "
    exit 1
}
#===============================================================================
# Log function
#===============================================================================
function log() {
    TAG=${FUNCNAME[0]}
    if [ ${QUIET} = "true" ]
        then
            echo -e "[${NAME}] ${@}" >> ${LOGFILE}
        else
            echo "[${NAME}] ${@}" | tee -a ${LOGFILE}
    fi
}
#===============================================================================
# Cleanup function - will remove scratch directory
#===============================================================================
function cleanup() {
    TAG=${FUNCNAME[0]}
    if [[ -d "${SCRATCH}" ]]
        then
            log "[I] [${TAG}]"
            rmdir "${SCRATCH}"
    fi
}
#===============================================================================
# Sendstatus function - Sends an email to defined email address
#===============================================================================
function sendstatus() {
    TAG=${FUNCNAME[0]}
    cat ${LOGFILE} | mail -s "[${NAME}] ${@}" ${EMAIL}
    log "[N] [${TAG}]"
}
#===============================================================================
# Exit function - Will be called upon error
#===============================================================================
function die() {
    TAG=${FUNCNAME[0]}
    log "[E] [${TAG}]"
    sendstatus
    cleanup
    log "[I] stop"
    exit 2
}
#===============================================================================
# Source default config if readable and is not empty
#===============================================================================
if [ -r ${CONFIGFILE} ] && [ -s ${CONFIGFILE} ]
    then
        source ${CONFIGFILE}
fi
#===============================================================================
# Makes sure we are not already running
#===============================================================================
if [ $(ps h -C ${SCRIPTNAME} | grep -v $$ | wc -l) -gt 1 ]
    then
        log "[I] script already running"
        die
fi
#===============================================================================
# Get script options ($@) - See function usage
#===============================================================================
while getopts :dhq args
do
  case ${args} in
      d)  set -x ;;
      h)  usage ;;
      q)  QUIET="true" ;;
      *)  usage ;;
  esac
done
#===============================================================================
# Finally - Now we run :-)
#===============================================================================
trap 'die' 1 2 3 15
mkdir "${SCRATCH}"
log "[I] [start]"
main "${@}"
cleanup
log "[I] [stop]"
