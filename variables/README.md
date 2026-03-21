# Some variable checks

- Make file empty `: > file`

- [Source 1 - Bash Shell Find Out If a Variable Is Empty Or Not](https://www.cyberciti.biz/faq/unix-linux-bash-script-check-if-variable-is-empty)

### Is it empty?
Various commands:
````
[ -z "$var" ] && echo "Empty"                             #option 1
[[ -z "$var" ]] && echo "Empty"                           #option 2
[ ! -z "$var" ] || echo "Empty"                           #option 3
[[ ! -z "$var" ]] || echo "Empty"                         #option 4
if [ -z "$var" ]; then; echo "empty"; fi                  #option 5
[ ! -z "$var" ] && echo "Not empty" || echo "Empty"       #option 6
[[ ! -z "$var" ]] && echo "Not empty" || echo "Empty"     #option 7
````
### Is it empty OR not?
Option 1
````
if [ -z "$var" ]
then
      echo "\$var is empty"
else
      echo "\$var is NOT empty"
fi
````
Option 2
````
if test -z "$var" 
then
      echo "\$var is empty"
else
      echo "\$var is NOT empty"
fi
````

### source a file
To "source" a file means running a file in the current shell environment. That means the variables defined can be used.
```shell
(. /etc/os-release && echo "$VERSION_CODENAME")   # example from debian
#1. source the file "/etc/os-release". A dot "." equals source in POSIX shells
#2. if sourcing was successfull (exit-status 0)) then "echo" the variable called "$VERSION_CODENAME" from the file


```
