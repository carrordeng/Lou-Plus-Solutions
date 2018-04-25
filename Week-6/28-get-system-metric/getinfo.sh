#!/bin/bash

disk_usage=$(df -h | awk -F " " '{if($6=="/") {print $5}}' | tr -d "%")

mem_total=$(free -m | awk -F " " '{if($1=="Mem:") {print $2}}')
mem_used=$(free -m | awk -F " " '{if($1=="Mem:") {print $3}}')
mem_usage=$(awk 'BEGIN{printf ("%.1f",'${mem_used}'/'${mem_total}'*100)}')

cpu_core_num=$(cat /proc/cpuinfo | grep -c "cpu cores")
load_cores=$(uptime | awk '{print $10}' | tr -d ",")
load_one_core=$(awk 'BEGIN{printf ("%.2f",'${load_cores}'/'${cpu_core_num}')}')

if [[ disk_usage -gt 85 ]];then
    printf "Disk-Root: \t need notice,use: $disk_usage%%\n"
else
    printf "Disk-Root: \t is OK,use: $disk_usage%%\n"
fi

if expr $mem_usage \> 90 >& /dev/null;then
    printf "Memory: \t need notice,use: $mem_usage%%\n"
else
    printf "Memory: \t is OK,use: $mem_usage%%\n"
fi

if expr $load_one_core \> 0.7 >& /dev/null;then
    printf "Loadaverage: \t need notice,use: $load_one_core\n"
else
    printf "Loadaverage: \t is OK,use: $load_one_core\n"
fi
