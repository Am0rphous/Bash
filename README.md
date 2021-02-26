# Bash

- [AMSITrigger](https://github.com/RythmStick/AMSITrigger) - The Hunt for Malicious Strings.
- [Anti DDOS - Bash Script Project](https://github.com/anti-ddos/Anti-DDOS)
- [Most Useful Bash Scripts for Linux System Administrator](https://www.techbrown.com/most-useful-bash-scripts-linux-system-administrator/)
- [Nimx](https://github.com/yglukhov/nimx) - GUI library.
- [Shellntel's scripts](https://github.com/Shellntel/scripts) - A collection of scripts from the security professionals at www.shellntel.com.


## Writing effective bash scripts
  ### 1. Comments
  Always use comments, so other people can easier understand your thinking, and the purpose of the script/commad.
  ````
  #this is a singel comment
  <#
  multiple
  lines
  of
  comments
  <#
  ````
  Nother way is using `Here Document`
  ````
  << Multiline_Comment
  this is
  also multiple
  lines
  Multiline_Comment
  ````
  ### 2. Exit when somethings fails in the script
  If a certain command fails it often affects the rest of the script. To make the script exit if a command fails, use one of these:
  ````
  set -o errexit      #option 1
  set -e              #option 2
  ````
  ### 3. Exit when an undeclared variable is used
  If an undeclared variable is used, it can result in logical error. Instruct bash to stop if an undeclared variable is trying to be used.
  ````
  set -o nounset     #option 1
  set -u             #option 2
  ````
  ### 4. When comparing strings use =
  == is synonym for =. Use single = when comparing a string
  ````
  variable1="testing
  variable2="test"
  if [ "$variable1" = "$variable2" ]
  ````
  ### 5.
  ````
  
  ````
  ### 6.
  ````
  
  ````
