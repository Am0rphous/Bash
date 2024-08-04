# S c r i p t i n g

- [ Bash Basics ](https://linuxhandbook.com/tag/bash-beginner/) - This Bash Beginner Series teaches you the basics of Bash shell script in carefully created chapters. All the chapters include scripting examples and exercise that will help you in understanding the concept.
- [Lenny Face](https://www.lennyfacecopypaste.com/) - Useful symbols and icons you can use in your scripts.


1. _A script should be run without errors_
2. _It should perform the task for which it is intended_
3. _Program logic is clearly defined and apparent_
4. _A script does not do unnecessary work_
5. _Scripts should be reusable_

## Waiting for user input
````powershell
read -p "Write the path: " variableName
read -p "Press [ENTER] when finished..."
````

## Redirecting output
````powershell
sudo apt update > /dev/null 2>&1 

````

