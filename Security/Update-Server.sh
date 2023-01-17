#!/bin/bash
#Am0rphous 07.04.2021

RED=`echo "\033[31m"`
DEFAULT=`echo "\033[m"`

sudo apt update
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean

sudo updatedb
if [ -f /var/run/reboot-required ]; then
 printf "\n${RED}The server needs a reboot! \n\n${DEFAULT}"
 sudo shutdown -r 06:00 "I'm going to restart the server because of new updates."
 printf "\n"
fi
