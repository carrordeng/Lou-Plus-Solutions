function trans(bytes){
    split("B,KB,MB,GB",UNIT,",")
    for(i=1;i<=4;i++){
        if(bytes>=1024)
            bytes/=1024
        else
            break
    }
    return sprintf("%d%s",bytes,UNIT[i])
}

BEGIN{
    "grep eth0 /proc/net/dev" | getline lines
    split(lines,eth0line," ")
    "grep lo /proc/net/dev" | getline lines
    split(lines,loline," ")
    printf("eth0:\t%s\n",trans(eth0line[10]))
    printf("lo:\t%s\n",trans(loline[10]))
}
