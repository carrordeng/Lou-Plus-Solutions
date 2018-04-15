#!/bin/bash

PORT=$1

OUTPUT=$(netstat -lunatp |& grep -w $PORT) 
#echo $OUTPUT

if [[ -z $OUTPUT ]];then
    echo "OFF"
else
    PROCESS=$(echo $OUTPUT | awk -F '/' '{print $2}' | uniq) 
    if [[ -z $PROCESS ]];then
        echo "Can't get the process name"
    else
        NAME=$(echo $PROCESS | awk -F ' ' '{print $1}')
        #echo $NAME
        echo $(which $NAME)
    fi
fi
