#!/bin/bash
if [ -f /var/run/reboot-required ]; then
  printf "I need reboot \n\n"
fi
