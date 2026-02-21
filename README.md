# Bash (work in progress)


https://www.reddit.com/r/bash/s/4DTpl5YYAX

- https://www.debian.org/doc/user-manuals#debian-handbook
- [https://guide.bash.academy](https://guide.bash.academy)
- https://www.linuxcommand.org/tlcl.php
 [source](https://github.com/lhunath/guide.bash.academy)
- [Bash-guide](https://github.com/Idnan/bash-guide) - A guide to learn bash.
- [bash-it](https://github.com/Bash-it/bash-it) - A community Bash framework.
- [Bash-Oneliner](https://github.com/onceupon/Bash-Oneliner) - A collection of handy Bash One-Liners and terminal tricks for data processing and Linux system maintenance.
- [bashell](https://gitlab.com/zoralab/BaSHELL) - A simple git repository framework for unit-testing your bash scripts, coded purely using BASH script too.
- [bashell snap package](https://snapcraft.io/bashell)
- [Dmatch](https://github.com/guelfoweb/dmatch) - a simple pattern matching implementation to get and organize the results of the dumps.
- [ExplainShell.com](https://explainshell.com)
- [Extracter](https://github.com/rootkit-io/Extracter) - This is a simple script that can extract any kind of archive.
- [Most Useful Bash Scripts for Linux System Administrator](https://www.techbrown.com/most-useful-bash-scripts-linux-system-administrator/)
- [Parsing data in bash](https://github.com/r00t-3xp10it/hacking-material-books/blob/master/bash/parsing_data_in_bash.md)
- [pSpy](https://github.com/DominicBreuker/pspy) - Monitor linux processes without root permissions
- [Shell Scripting for Beginners – How to Write Bash Scripts in Linux](https://www.freecodecamp.org/news/shell-scripting-crash-course-how-to-write-bash-scripts-in-linux/)
- [shellcheck](https://github.com/koalaman/shellcheck) - ShellCheck, a static analysis tool for shell scripts
- [Shellntel's scripts](https://github.com/Shellntel/scripts) - A collection of scripts from the security professionals at www.shellntel.com.


## Writing effective bash scripts
- A script should be run without errors
- It should perform the task for which it is intended
- Program logic is clearly defined and apparent
- A script does not do unnecessary work
- Scripts should be reusable
- Try using "set -x" which prints commands and their arguments as they are executed.


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
