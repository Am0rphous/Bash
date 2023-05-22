#!/bin/bash

## This is not my script. Source: https://gist.github.com/dvershinin/79d506286c5e25eee3b568cbe2346ea3
## Credit: dvershinin - (Danila Vershinin )


# TODO: chkconfig cpuspeed off
# CSF: SYNFLOOD = "0" # value of "1" will slow down all new connections from any IP address to
# the server if triggered
# integrate SSD existence test

#A quick bash script for sanity checks of a Linux web server.
#curl -L https://git.io/fpcqY | bash
#Centos7: journalctl --no-pager --priority=err --dmesg | grep "Out of memory"
#Centos8: journalctl --no-pager --priority=err --dmesg --grep="Out of memory"

# STATUS: do not update here, moved to internal https://github.com/GetPageSpeed/servcheck


if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root or via sudo" 1>&2
   exit 1
fi

bold=$(tput bold)
normal=$(tput sgr0)
red=$(tput setaf 1)

ISSUES=()
PASSED=()
ARRAY+=('foo')
ARRAY+=('bar')

KILLED_PROCS=$(grep -i -r --perl-regexp '(kernel: Killed process)|(oom-killer:)' /var/log/)
if [ $? -ne 0 ]; then
  PASSED+=('Did not find killed procs. No OOMs')
else
  ISSUES+=("${bold}Out of Memory conditions. ${normal}Server is severely misconfigured. You need to adjust PHP-FPM and MySQL settings.")
fi

echo "HELO localhost" 2>/dev/null >/dev/tcp/localhost/25
if [ $? -ne 0 ]; then
  ISSUES+=("${bold}Local SMTP is not active. ${normal}PHP scripts relying on mail() function will likely timeout and cause PHP-FPM performance issues")
fi

#TODO integrate check to external mail server
echo exit | telnet aspmx.l.google.com 25

if free | awk '/^Swap:/ {exit !$2}'; then
  PASSED+=('Swap space exists')
else
  ISSUES+=("${bold}No swap space.")
fi

if [ ${#ISSUES[@]} -eq 0 ]; then
    echo "No bvious problems, hooray"
else
    echo "${bold}[ISSUES FOUND]"
    echo "----------------------"
    printf '* %s\n' "${ISSUES[@]}"
fi

if [ -n "$KILLED_PROCS" ]; then
  echo ""
  echo "${red}${bold}[OUT OF MEMORY CASES FOUND]"
  echo "-----------------------"
  echo "${KILLED_PROCS}" | tail -n 2
  echo "${normal}"
fi

