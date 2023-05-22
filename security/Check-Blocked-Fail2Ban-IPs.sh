#!/bin/bash

sudo fail2ban-client status ssh

#Some distros create sshd instead of ssh
sudo fail2ban-client status sshd

sudo zgrep 'Ban' /var/log/fail2ban.log*

sudo awk '($(NF-1) = /Ban/){print $NF}' /var/log/fail2ban.log | sort | uniq -c | sort -n

sudo fail2ban-client status | grep "Jail list:" | sed "s/ //g" | awk '{split($2,a,",");for(i in a) system("fail2ban-client status " a[i])}' | grep "Status\|IP list"
