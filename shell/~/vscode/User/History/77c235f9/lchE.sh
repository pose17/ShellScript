#!/bin/bash

if [ ]

SERVERLIST=/root/shell/server.txt

cat << EOF > $SERVERLIST
172.16.6.250
172.16.6.202
172.16.6.203
EOF

for i in $(cat $SERVERLIST)
do
    echo "----- $SERVERLIST -----"
    ssh "$i" "$CMD"
done

