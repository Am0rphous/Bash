#!/bin/bash
NORMAL=`echo "\033[m"`        #Tilbakestiller til normal farge på tekst
RED="\033[0;31m"              #Ordner rød farge
GREEN="\033[0;32m"            #Ordner grønn farge

if [ -f /var/run/reboot-required ]; then
  echo "\n ${RED}Server bør restartes!\n ${NORMAL}"
else
  echo "\n ${GREEN}Server trenger ikke restart!\n ${NORMAL}"
fi
