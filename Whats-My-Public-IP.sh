#!/bin/bash

curl ifconfig.me
curl ipinfo.io/ip

curl icanhazip.com

wget http://ipecho.net/plain -O - -q ; echo
dig +short myip.opendns.com @resolver1.opendns.com

#Save it as a variable
PublicIP=`wget http://ipecho.net/plain -O - -q ; echo`
echo $PublicIP
