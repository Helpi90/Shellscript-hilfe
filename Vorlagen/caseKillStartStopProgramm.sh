#!/bin/bash
#
# Script used by openHAB2 to check, start and stop a program on command line

status(){
	[ "$(pidof $1)" ] && echo "ON" || echo "OFF";
}

start(){
	$1
}

stop(){
	killall $1
}

case "$1" in
  start)
        start $3$2
        ;;
  stop)
        stop $3$2
        ;;
  status)
        status $2
        ;;
  restart)
        stop $3$2
        start $3$2
        ;;
   *)
        echo "Usage: $0 {start|stop|status|restart} program programpath"
        exit 2
esac