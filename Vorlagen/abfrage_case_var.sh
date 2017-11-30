#!/bin/bash
# run under sudo
# script for permanently setting environment variables, found here:
# https://stackoverflow.com/questions/13046624/how-to-permanently-export-a-variable-in-linux
if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not sudo."
	exit 1
fi
echo "Enter variable name: "
read variable_name
echo "Enter variable value: "
read variable_value
echo "adding " $variable_name " to environment variables: " $variable_value
echo "export "$variable_name"="$variable_value>>~/.bashrc
echo $variable_name"="$variable_value>>~/.profile
echo $variable_name"="$variable_value>>/etc/environment
source ~/.bashrc
source ~/.profile
echo "do you wanna restart your computer to apply changes in /etc/environment file? yes(y)no(n)"
read restart
case $restart in
    y) sudo shutdown -r 0;;
    n) echo "don't forget to restart your computer manually";;
esac
exit