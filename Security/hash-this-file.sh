#/bin/bash

#colors
NORMAL=`echo "\033[m"`
BLUE=`echo "\033[36m"`

#make the user write name or path
read -p "Name or path to file: " file

#hash and save it as a variable
sha1Hash=$(shasum -a 1 $file)
md5Hash=$(md5 --quiet $file)
sha256Hash=$(shasum -a 256 $file)
sha512Hash=$(shasum -a 512 $file)

#present it in a nice way to the user
printf "\n${BLUE}SHA1 hash:   ${NORMAL}$sha1Hash"
printf "\n${BLUE}MD5 hash:    ${NORMAL}$md5Hash"
printf "\n${BLUE}SHA256 hash: ${NORMAL}$sha256Hash"
printf "\n${BLUE}SHA512 hash: ${NORMAL}$sha512Hash"
printf "\n\n"
