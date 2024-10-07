#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <CMD OPTIONS ARGS>"
    exit 1
fi
CMD="$*"

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

