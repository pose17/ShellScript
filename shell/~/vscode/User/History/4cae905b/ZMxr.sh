#!/bin/bash

IP=172.16.6.1
UNAME=user01
UPASS=user01

ftp -n "$IP" << EOF
user $UNAME $UPASS
cd test
lcd /test

EOF
