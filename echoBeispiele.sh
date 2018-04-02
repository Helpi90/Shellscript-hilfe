#!/bin/bash
###
# Filename:          echoBeispiele.sh
# Project:           Shellscript-hilfe
# Author:            macbook 
# -----
# File Created:      31-03-2018
# -----
# Last Modified:     31-03-2018
# Modified By:       macbook 
# -----
###


#!/bin/bash
ls /media/sda1/VPN/ > /media/sda1/dateien.txt
echo "============================================================ VPN Manager ======================================================================"
showMenu(){
echo "--------------------"
echo " menu"
echo "--------------------"
grep 'conf' /media/sda1/dateien.txt > /media/sda1/dateien1.txt
sed = /media/sda1/dateien1.txt | sed 'N; s/^/ /; s/ *\(.\{6,\}\)\n/\1 /' | sed 's/\(.*\)\.[^.]*$/\1/'
echo " 0 VPN beenden"
echo " 100 Abbrechen"
echo "--------------------"

read -p "Bitte Nummer des Servers angeben: " mc
return $mc
}
string=$(curl -s ipinfo.io/org ) 
if [ "$string" = "AS8881 1&1 Versatel Deutschland GmbH" ]; then
echo "Status:"
echo -e "\e[31mServer nicht verbunden!\e[0m"
#kodi-send -a "Notification(GooseVPN,OVPN ist offline.)"
else
echo "Status:"
echo -e "\e[93mServer verbunden.\e[0m"
#kodi-send -a "Notification(GooseVPN,OVPN ist verbunden.)"
fi
echo "========================================================= VPN Server Auswahl =================================================================="
showMenu
m=$?
if [ "$m" == "0" ] ; then
echo "========================================================= Stop VPN Service ===================================================================="
killall -9 openvpn
modprobe -r tun.ko
echo "Beende VPN Service"
echo "============================================================= IP direkt ======================================================================="
curl ipinfo.io
echo
echo "Service beendet"
elif [ "$m" == "100" ]; then
exit 0
fi
server=$(head -n$m /media/sda1/dateien.txt|tail -n1)
echo "Verbinde mit Server $server"
#string1=$(curl -s ipinfo.io/org )
modprobe tun.ko
echo "============================================================= IP vorher ======================================================================="
curl ipinfo.io
echo
echo "========================================================= Stop VPN Service ===================================================================="
killall -9 openvpn
/sbin/openvpn /media/sda1/VPN/$server
sleep 10
echo
echo "==============================================================IP nachher ======================================================================"
curl ipinfo.io
echo
echo "================================================= Neuen Server in die Autostart eintragen? ===================================================="
#read -n 1 -p"Beim Neustart mit dem Server verbinden(j/n)? " response
#echo
#if [ "$response" == "j" ]; then
#echo
#echo "openvpn --daemon --config /storage/vpn/$server" > /storage/.config/autostart.sh
#echo "(sleep 20; sh /storage/nachricht.sh)&" >> /storage/.config/autostart.sh
#echo "Start-Server gewechselt."
#fi
echo "==============================================================================================================================================="
string=$(curl -s ipinfo.io/org ) 
if [ "$string" = "AS8881 1&1 Versatel Deutschland GmbH" ]; then
echo "----------------"
echo -e "\e[31mServer nicht verbunden!\e[0m"
#kodi-send -a "Notification(GooseVPN,OVPN ist offline.)"
else
echo "----------------"
echo -e "\e[93mServer verbunden.\e[0m"
#kodi-send -a "Notification(GooseVPN,OVPN ist verbunden.)"
fi