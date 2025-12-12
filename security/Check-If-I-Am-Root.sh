#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ "$(whoami)" == "root" ] ; then
 echo "you are root"
else
 echo "you are not root"
fi

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

if [[ `id -u` -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
