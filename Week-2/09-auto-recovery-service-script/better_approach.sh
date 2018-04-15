#!/bin/bash

sudo service $1 status &> /dev/null
status=$?

case $status in
0)
    echo "is Running";;
1)
    echo "Error: Service Not Found" && exit 1;;
3)
    echo "Restarting"
    sudo service $1 start &> /dev/null;;
*)
    echo "ERROR" && exit 1
esac
