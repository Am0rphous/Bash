# S c r i p t i n g

- [ Bash Basics ](https://linuxhandbook.com/tag/bash-beginner/) - This Bash Beginner Series teaches you the basics of Bash shell script in carefully created chapters. All the chapters include scripting examples and exercise that will help you in understanding the concept.
- [Lenny Face](https://www.lennyfacecopypaste.com/) - Useful symbols and icons you can use in your scripts.


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

