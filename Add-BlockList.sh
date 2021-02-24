#!/bin/bash
#https://www.cyberciti.biz/faq/how-to-block-an-ip-address-with-ufw-on-ubuntu-linux-server/

while IFS= read -r block
do 
   sudo ufw insert 1 deny from "$block" 
done < "blocked.ip.list"
