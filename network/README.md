# Network

- [LOCALipSweep](https://github.com/ev0l3t/LOCALipSweep)
- Route VNC traffic through SSH
  ````shell
  #!/bin/sh
  port="99"
  brukernavn="mike"
  ipAdresse="10.0.0.10"
  GreenColor="\033[0;32m"
  RedColor="\033[0;31m"
  
  ssh -p $port -L 5900:127.0.0.1:5900 -N -f -l $brukernavn $ipAdresse
  if [ $? -eq 0 ]; then
      echo "\n ${GreenColor}Suksess! Ruter nå VNC gjennom lokal SSH til IP $ipAdresse \n"
  else
      echo "\n ${RedColor}Woops, det gikk ikke!\n"
  fi
  ````
