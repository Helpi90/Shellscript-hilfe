#!/bin/bash
#
# initd-example      Node init.d 
#
# chkconfig: 345 80 20
# description: Node init.d example
# processname: node
# pidfile: /var/run/initd-example.pid
# logfile: /var/log/initd-example.log
#

# Source function library.
. /lib/lsb/init-functions

NAME=initd-example                  # Unique name for the application
NODE_ENV=production                 # Node environment
PORT=1234                           # Port (in this case the application uses process.env.PORT to set the port)
INSTANCE_DIR=/var/www/$NAME         # Location of the application source
COMMAND=coffee                      # Command to run
SOURCE_NAME=app.coffee              # Name os the applcation entry point script

user=apache
pidfile=/var/run/$NAME.pid
logfile=/var/log/$NAME.log
forever_dir=/var/run/forever        # Forever root directory.

node=node
forever=forever
awk=awk
sed=sed

start() {
    echo "Starting $NAME node instance: "

    if [ "$id" = "" ]; then
        # Create the log and pid files, making sure that the target use has access to them
        touch $logfile
        chown $user $logfile

        touch $pidfile
        chown $user $pidfile

        # Launch the application
        start_daemon
            $forever start -p $forever_dir --pidFile $pidfile -l $logfile -a -d $INSTANCE_DIR -c $COMMAND $SOURCE_NAME
        RETVAL=$?
    else
        echo "Instance already running"
        RETVAL=0
    fi
}

restart() {
    echo -n "Restarting $NAME node instance : "
    if [ "$id" != "" ]; then
        $forever restart -p $forever_dir $id
        RETVAL=$?
    else
        start
    fi
}

stop() {
    echo -n "Shutting down $NAME node instance : "
    if [ "$id" != "" ]; then
        $forever stop -p $forever_dir $id
    else
        echo "Instance is not running";
    fi
    RETVAL=$?
}

getForeverId() {
    local pid=$(pidofproc -p $pidfile)
    $forever list -p $forever_dir | $sed -e 's/\x1b\[[0-9; ]*m//g' | $awk "\$6 && \$6 == \"$pid\" { gsub(/[\[\]]/, \"\", \$2); print \$2; }";
}
id=$(getForeverId)

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        status -p ${pidfile}
        ;;
    restart)
        restart
        ;;
    *)
        echo "Usage:  {start|stop|status|restart}"
        exit 1
        ;;
esac
exit $RETVAL