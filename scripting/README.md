# S c r i p t i n g

- [ Bash Basics ](https://linuxhandbook.com/tag/bash-beginner/) - This Bash Beginner Series teaches you the basics of Bash shell script in carefully created chapters. All the chapters include scripting examples and exercise that will help you in understanding the concept.
- [Lenny Face](https://www.lennyfacecopypaste.com/) - Useful symbols and icons you can use in your scripts.

<br>

1. _A script should be run without errors_
2. _It should perform the task for which it is intended_
3. _Program logic is clearly defined and apparent_
4. _A script does not do unnecessary work_
5. _Scripts should be reusable_

<br>

## Waiting for user input
````powershell
read -p "Write the path: " variableName
read -p "Press [ENTER] when finished..."
````

## Redirecting output
````shell
sudo apt update > /dev/null 2>&1            #redirects output to null (displays nothing at all)
ls non_existent_file > output.txt 2>&2      #output to file and error to terminal
````

## Loops
- [Source 1 - How To Unix For Loop 1 to 100 Numbers](https://www.cyberciti.biz/faq/unix-for-loop-1-to-10)
- [Source 2 - Loops! ](https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php)
The purpose of loops is to take a series of commands and re-run them with minimal code. Often used in automation and repetitive tasks. Syntax:
````powershell
while [ <something> ]
do
  <command>
done
````
Example
````powershell
#!/bin/bash
counter=1
while [ $counter -le 10 ]      #lt=less than. -le=less than or equal (will print up until nine)
do
  echo $counter
  ((counter++))
done
echo "done!"
````

A For loop in bash:
````powershell
#!/bin/bash
for ((i=1;i<=10;i++)); 
do 
   #Doing lots of stuff here
   echo $i
done
````
