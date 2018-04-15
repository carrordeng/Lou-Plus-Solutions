#!/bin/bash

setenforce=1

sed -i 's/SELINUX=\S*$/SELINUX=enforcing' /etc/selinux/config

yum install -y setroubleshoot-server
systemctl restart auditd.service
systemctl restart rsyslog.service

mkdir /home/shiyanlou/website

chown -R --reference /var/www/html /home/shiyanlou/website
chgrp -R --reference /var/www/html /home/shiyanlou/website
chcon -R --reference /var/www/html /home/shiyanlou/website

touch /home/shiyanlou/config
chcon -t httpd_sys_content_t /home/shiyanlou/config
