sudo service rsyslog start
sudo cron -f &
cd ~
crontab -e
00 3 * * * cd /home/shiyanlou/backup && tar -zcf 'date + \%Y-\%m-\%d'.tar.gz -g metadata /var/log
#or
00 3 * * * cd /home/shiyanlou/backup && tar -zcf /home/shiyanlou/backup/$(date + \%Y-\%m-\%d).tar.gz -g metadata /var/log
#or
00 3 * * * tar -zcf /home/shiyanlou/backup/$(date + \%Y-\%m-\%d).tar.gz -g /home/shiyanlou/backup/metadata /var/log
