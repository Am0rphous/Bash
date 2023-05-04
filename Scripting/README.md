# S c r i p t i n g

- [Shell Scripting for Beginners – How to Write Bash Scripts in Linux](https://www.freecodecamp.org/news/shell-scripting-crash-course-how-to-write-bash-scripts-in-linux/)

- _"A script should be run without errors"_
- _"It should perform the task for which it is intended"_
- _"Program logic is clearly defined and apparent"_
- _"A script does not do unnecessary work"_
- _"Scripts should be reusable"_

## Waiting for user input
````powershell
read -p "Write the path: " variableName
read -p "Press [ENTER] when finished..."
````

## Redirecting output
````powershell
sudo apt update > /dev/null 2>&1 

````

