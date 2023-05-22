#!/bin/bash
# ${1?"Usage: $0 ip subnet to scan. eg '192.168.1.'"}
# bash scan-ip-adresses.sh 192.168.1

subnet=192.168.1.
for addr in `seq 130 190 `; do
#   ( echo $subnet$addr)
( ping -c 3 -t 5 $subnet$addr > /dev/null && echo $subnet$addr is Alive && nslookup $subnet$addr) &
done 
