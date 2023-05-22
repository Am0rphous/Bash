#!/bin/bash

# Most systems today run 64-bit versions of Linux.
# 64-bits architecture offer better performance and security.

if [ `getconf LONG_BIT` = "64" ]
then
    echo "I'm 64-bit"
else
    echo "I'm 32-bit"
fi

#Other ways and commands
uname -m
uname -i
uname -p
uname -a
arch

lscpu
echo $HOSTTYPE
file /usr/bin/id
file /lib/systemd/systemd

dpkg --print-architecture
sudo lshw -c cpu | grep width
