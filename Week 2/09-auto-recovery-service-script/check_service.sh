touch check_service.sh

vim check_service.sh

 

#!/bin/bash

 

ser_stat=-1

 

sudo service $1 status |& grep -iq "\* $1 is stopped" && ser_stat=0 || ser_stat=1

sudo service $1 status |& grep -iq "\* $1 is not running" && ser_stat=0 || ser_stat=1

sudo service $1 status |& grep -iq "$1: unrecognized service" && ser_stat=-1

 

case $ser_stat in

-1)

echo "Error: Service Not Found";;

0)

echo "Restarting"

sudo service $1 start > /dev/null;;

1)

echo "is Running";;

*)

echo "ERROR";;

esac

 

 

chmod +x check_service.sh

sudo cron -f &

crontab -e

 

00 00 * * * /home/shiyanlou/check_service.sh mysql
