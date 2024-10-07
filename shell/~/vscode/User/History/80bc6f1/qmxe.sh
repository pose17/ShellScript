#!/bin/bash

SERVERLIST=/root/shell/server.list

for i in $(cat $SERVERLIST)
do

    Cmd() {
        sleep 2 ; echo 'user01'
        sleep 1 ; echo 'user01'
        sleep 1 ; echo 'hostname'
        sleep 1 ; echo 'ls -l'
        sleep 1 ; echo 'exit'
    }
    Cmd | telnet localhost 

done
