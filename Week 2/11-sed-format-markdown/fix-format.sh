/^\s*$/{
    N
    /\n$/D
}

s/\[picture\-\S*\]\(\S*\.png\S*\)/\!&/g
s/\[picture\-\S*\]\(\S*\.jpg\S*\)/\!&/g
