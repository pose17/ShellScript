#!/bin/bash

IP=172.16.6.250

Cmd() {
    sleep 2   ; echo 'root'
    sleep 0.5 ; echo 'centos'
    sleep 0.5 ; echo 'hostname'
    sleep 0.5 ; echo 'tar cvzf /tmp/linux213.tar.gz /home'
    sleep 0.5 ; echo 'exit'
}

Cmd | telnet $IP 

ftp -n $IP << EOF
user root centos
cd /tmp
lcd /root
EOF

