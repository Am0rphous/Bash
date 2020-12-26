#!/bin/bash
#https://blog.imunify360.com/php-malware-obfuscation-using-goto

grep -Pr "\bgoto\s+\w+;" | grep -Pv "\.svn|Binary file" | sort -u
