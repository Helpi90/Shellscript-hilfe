#!/bin/bash
argument="$1"

# This script GET's data from the SkyFi unit and updates OH to match.
# Version 1.0 03/10/2016

## Daikin Settings
# Daikin IP Address and Port
	DIP=192.168.1.39:2000
# Daikin SkyFi Password
  DPass=xxxxx

## OH Settings
# OH IP Address and Port
	OIP=192.168.1.20:8080
# On/Off button item name
	OoId=heatingDaikinPower
# Temp item name
	TempId=heatingDaikinTemp
# Temp sensor data
	TempIn=heatingDaikinTempIn
	TempOut=heatingDaikinTempOut
# Mode item name
	ModeId=heatingDaikinMode
# Fan speed item name
	FanSpId=heatingDaikinFanSp
# Fan speed item name
	FanModeId=heatingDaikinFanMode

############################################################
# NO CHANGES AFTER THIS LINE ## NO CHANGES AFTER THIS LINE #
############################################################

# SkyFi info url path
skyfi="$DIP/ac.cgi?pass=$DPass"
skyfiset="$DIP/set.cgi?pass=$DPass"

# Set complete path for Daikin SkyFi Contol
SkyFiInfoPath=http://$skyfi
SkyFiInfo=$(curl --silent --header 'Content-Type: application/json' $SkyFiInfoPath)

#sleep 10

#echo $SkyFiInfo

# SkyFiInfo Will retun something like: opmode=0&units=.&settemp=24.0&fanspeed=3&fanflags=1&acmode=4&tonact=0&toffact=0&prog=0&time=21:27&day=4&roomtemp=14&outsidetemp=14&louvre=1&zone=0&flt=0&test0&errcode=&sensors=1

# Get relevant information from Daikin SkyFi unit
daikinArray=($SkyFiInfo)

IFS='&' read -r -a daikinArray <<<"$SkyFiInfo"
powStr=${daikinArray[0]}
stempStr=${daikinArray[2]}
f_rateStr=${daikinArray[3]}
f_modeStr=${daikinArray[4]}
modeStr=${daikinArray[5]}
htempStr=${daikinArray[11]}
otempStr=${daikinArray[12]}
dzoneStr=${daikinArray[14]}
filterStr=${daikinArray[15]}

# Variables from returned string
pow=${powStr//[^0-9]/} #Power on(1)/off(0)
mode=${modeStr//[^0-9]/}	#Mode (1=auto,2=heat,4=dry,8=cool,16=fan,9=cool/auto,3=heat/auto)
stemp=${stempStr:(-4)}	#Temperature set point
f_rate=${f_rateStr//[^0-9]/}	#Fan speed (1=low,2=med,3=high,5=low/auto,6=med/auto,7=high/auto)
f_mode=${f_modeStr//[^0-9]/}		#Fan (1 = Manual, 3= Auto)
htemp=${htempStr//[^0-9]/}	 	#Current Room Temp
otemp=${otempStr//[^0-9]/}	 	#Current Outside Temp
dzone=${dzoneStr//[^0-9]/}  	#Zones Enabled (Zone 1 = 128 Zone 2 = 64 Zone 3 = 32 Zone 4 = 16 Zone 5 = 8 Zone 6 = 4 Zone 7 = 2 Zone 8 = 1)
filter=${filterStr//[^0-9]/}	#Filter clean 1=yes

if [ "$pow" = "" ]; then
    echo error reading daikin controller
		exit
fi

###################################################
# POST temperature values to the openHAB REST API #
###################################################
curl --silent --header 'Content-Type: text/plain' --request PUT "http://$OIP/rest/items/$TempIn/state" --data $htemp
curl --silent --header 'Content-Type: text/plain' --request PUT "http://$OIP/rest/items/$TempOut/state" --data $otemp
curl --silent --header 'Content-Type: text/plain' --request PUT "http://$OIP/rest/items/$TempId/state" --data $stemp
curl --silent --header 'Content-Type: text/plain' --request PUT "http://$OIP/rest/items/$ModeId/state" --data $mode
curl --silent --header 'Content-Type: text/plain' --request PUT "http://$OIP/rest/items/$FanSpId/state" --data $f_rate
curl --silent --header 'Content-Type: text/plain' --request PUT "http://$OIP/rest/items/$FanModeId/state" --data $f_mode
#curl --silent --header 'Content-Type: text/plain' --request PUT "http://$OIP/rest/items/$OoId/state" --data $pow

case $pow in
     "0")
        curl --silent --header 'Content-Type: text/plain' --request PUT "http://$OIP/rest/items/$OoId/state" --data "OFF"
        ;;
     "1")
        curl --silent --header 'Content-Type: text/plain' --request PUT "http://$OIP/rest/items/$OoId/state" --data "ON"
        ;;
     *)
esac

echo Set power to $pow, mode to $mode, setpoint to $stemp, fan speed to $f_rate, fan mode to $f_mode, room temp to $htemp, and outside temp to $otemp.