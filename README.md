# Bash

- [AMSITrigger](https://github.com/RythmStick/AMSITrigger) - The Hunt for Malicious Strings.
- [Anti DDOS - Bash Script Project](https://github.com/anti-ddos/Anti-DDOS)
- [Bash-guide](https://github.com/Idnan/bash-guide) - A guide to learn bash.
- [bash-it](https://github.com/Bash-it/bash-it) - A community Bash framework.
- [Bash-Oneliner](https://github.com/onceupon/Bash-Oneliner) - A collection of handy Bash One-Liners and terminal tricks for data processing and Linux system maintenance.
- [Dmatch](https://github.com/guelfoweb/dmatch) - a simple pattern matching implementation to get and organize the results of the dumps.
- [Most Useful Bash Scripts for Linux System Administrator](https://www.techbrown.com/most-useful-bash-scripts-linux-system-administrator/)
- [Nimx](https://github.com/yglukhov/nimx) - GUI library.
- [Parsing data in bash](https://github.com/r00t-3xp10it/hacking-material-books/blob/master/bash/parsing_data_in_bash.md)
- [pSpy](https://github.com/DominicBreuker/pspy) - Monitor linux processes without root permissions
- [Shellntel's scripts](https://github.com/Shellntel/scripts) - A collection of scripts from the security professionals at www.shellntel.com.

Usefull
- [bashell](https://gitlab.com/zoralab/BaSHELL) - A simple git repository framework for unit-testing your bash scripts, coded purely using BASH script too.
- [bashell snap package](https://snapcraft.io/bashell)
- [Lenny Face](https://www.lennyfacecopypaste.com/) - Useful symbols and icons you can use in your scripts.

## Writing effective bash scripts
- A script should be run without errors
- It should perform the task for which it is intended
- Program logic is clearly defined and apparent
- A script does not do unnecessary work
- Scripts should be reusable
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
