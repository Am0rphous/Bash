#/bin/bash
#https://github.com/Am0rphous/Bash/blob/master/Security/hash.sh

#colors
NORMAL=`echo "\033[m"`
BLUE=`echo "\033[36m"`

#make the user write name or path
#read -p "Name or path to file: " file

#lets use an argument in stead, and check if it's empty
if test -z "$1" 
then
      echo "choose a single file dumbass :-)"; exit;
else
      file=$1
fi

#hash and save it as a variable. 'tr -d $file' removes the file name.
sha1Hash=$(shasum -a 1 $file | tr -d $file)
md5Hash=$(md5 -q $file | tr -d $file)
sha256Hash=$(shasum -a 256 $file | tr -d $file)
sha512Hash=$(shasum -a 512 $file | tr -d $file)

#present it in a nice way to the user
printf "\n${BLUE}File name:   ${NORMAL}$file"
printf "\n${BLUE}SHA1 hash:   ${NORMAL}$sha1Hash"
printf "\n${BLUE}MD5 hash:    ${NORMAL}$md5Hash"
printf "\n${BLUE}SHA256 hash: ${NORMAL}$sha256Hash"
printf "\n${BLUE}SHA512 hash: ${NORMAL}$sha512Hash"
printf "\n\n"
