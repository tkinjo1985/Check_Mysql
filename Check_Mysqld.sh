#!/bin/bash

function mysqldCheck(){
    exists=0
    echo "Process of MySQL Check if running."
    for psname in `ps ax | grep "mysqld" | awk '{print $5}'`
    do
            if [ "$psname" = "/usr/sbin/mysqld" ]
            then
                exists=1
            fi


    done


    if [ $exists -eq 0 ]
    then
        echo "Start Mysql."
        sudo /etc/init.d/mysql start
        echo "Done."
    fi
    echo "Finish."
}

mysqldCheck