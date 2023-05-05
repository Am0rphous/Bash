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
