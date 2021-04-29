#!/bin/bash

disk_usage=$(df -h | awk '$6~/^\/$/{print $5}' | awk -F '%' '{print $1}')
if [ $disk_usage -gt 85 ];then
  echo "Disk-Root $disk_usage% Alert"
else
  echo "Disk-Root $disk_usage% OK"
fi

mem_usage=$(free | awk '/Mem/{printf("%d",$3/$2*100)}')
if [ $mem_usage -gt 90 ];then
  echo "Memory $mem_usage% Alert"
else
  echo "Memory $mem_usage% OK"
fi

core_count=$(cat /proc/cpuinfo | grep -c "model name")
load=$(uptime | awk '{print $10}' | tr -d ',')
single_load=$(awk 'BEGIN{printf("%.1f","'${load}'"/"'${core_count}'")}')
echo $single_load
if expr $singleload > 0.7 >/dev/null 2>&1;then
  echo "Loadaverage $single_load Alert"
else
  echo "Loadaverage $single_load OK"
fi
