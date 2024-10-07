#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <IP1> <IP2>"
    exit1
fi
SERVER="$1"
REMOTE="$2"

export LANG=en_US.UTF-8

TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
TMP3=/tmp/tmp3

ssh "$SERVER" systemctl -t service \ 
| awk '{print $1, $3}' \ 
| sed -n '2,/^LOAD/p' | sed '$d' \
| sed '$d' > $TMP1

ssh "$REMOTE" systemctl -t service \ 
| awk '{print $1, $3}' \ 
| sed -n '2,/^LOAD/p' | sed '$d' \
| sed '$d' > $TMP2

diff TM1 TMP2 > $TMP3

echo "----- 172.16.6.200 -----"
cat $TMP3 | fgrep 
