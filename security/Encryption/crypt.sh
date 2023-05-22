#!/bin/bash
# Write a shell script to encrypt any text file
# -------------------------------------------------------------------------
# Copyright (c) 2001 nixCraft project <http://cyberciti.biz/fb/>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------
# This script is part of nixCraft shell script collection (NSSC)
# Visit http://bash.cyberciti.biz/ for more information.
# -------------------------------------------------------------------------
file=$1
echo -n "Enter a file name : "
read file
 
if [ ! -f $file ]
then
	echo "$file not a file!"
	exit 1
fi
 
echo -n "Enter a Password : "
read password
 
# do encryption using UNIX crypt command
# this command will prompt for a password
crypt $password < $file > $file.cpy
echo  "$file.cpy created as encrypted file"
