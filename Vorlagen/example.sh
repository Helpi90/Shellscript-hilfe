#!/usr/bin/env bash

appname=$(basename -s .git `git config --get remote.origin.url`)

txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
grn=$(tput setaf 2)             # Green
red=$(tput setaf 1)             # Red
bldgrn=${txtbld}$(tput setaf 2) # Bold Green
bldred=${txtbld}$(tput setaf 1) # Bold Red
txtrst=$(tput sgr0)             # Reset

usage()
{
cat << EOF
Project to manage beam\'s serverside infrastructure and code base
${txtbld}SYNOPSIS${txtrst}
    $0 clean
${txtbld}DESCRIPTION${txtrst}
    ${txtbld}clean${txtrst}
        clean the compiled source, drops all tables and runs ${txtbld}migrate${txtrst}
EOF
exit 1
}

echo_message() {
    echo "${bldgrn}[${appname}]${txtrst} ${grn}$1${txtrst}"
}

echo_error() {
    echo "${bldred}[${appname}]${txtrst} ${red}$1${txtrst}"
}

echo_line() {
    echo
    echo "${bldred}====================================================================================================>${txtrst}"
    echo
}

abort_on_error() {
    if [[ $? -ne 0 ]]; then
        echo_error "$1"
        exit 1
    fi
}

example() {
    echo_message 'Cleaning'
}

if [[ $# -eq 0 ]]; then
    usage
elif [ $1 = "example" ]; then
    example
else
  usage
fi