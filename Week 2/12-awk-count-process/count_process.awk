BEGIN{
    getline;
}

{
    cnt[$1]+=1
}

END{
    for(process in cnt){
        printf("%d\t%s\n",cnt[process],process)
    }
}
