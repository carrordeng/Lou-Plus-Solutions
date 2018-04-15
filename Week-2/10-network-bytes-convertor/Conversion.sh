#!/bin/bash

Convert(){
    case $2 in
    GB)
        echo "$1 $2";;
    MB)
        if [ $1 -ge 1024 ];then
            echo "$(($1/1024)) GB"
        else
            echo "$1 MB"
        fi;;
    KB)
        if [ $1 -lt 1024 ];then
            echo "$1 KB"
        elif [[ $1 -ge 1024 && $1 -lt 1024*1024 ]];then
            echo "$(($1/1024)) MB"
        else
            echo "$(($1/(1024*1024))) GB"
        fi;;
    *)
        if [[ ! -n "$2" || $2 -eq "B" ]];then
            if [ $1 -lt 1024 ];then
                echo "$1 B"
            elif [[ $1 -ge 1024 && $1 -lt 1024*1024 ]];then
                echo "$(($1/1024)) KB"
            elif [[ $1 -ge 1024*1024 && $1 -lt 1024*1024*1024 ]];then
                echo "$(($1/(1024*1024))) MB"
            else
                echo "$(($1/(1024*1024*1024))) GB"
            fi
        else
            echo "Input Error"
        fi;;
    esac
}

export Convert
