# Coloring
````
0 Black
1 Red
2 Green
3 Yellow
4 Blue
5 Magenta
6 Cyan
7 White
8 Not used
9 Reset to default color
````
To test different colors:
````
tput setaf 0; echo text ; tput setaf 9
tput setaf 1; echo text ; tput setaf 9
tput setaf 2; echo text ; tput setaf 9
tput setaf 3; echo text ; tput setaf 9
tput setaf 4; echo text ; tput setaf 9
tput setaf 5; echo text ; tput setaf 9
tput setaf 6; echo text ; tput setaf 9
tput setaf 7; echo text ; tput setaf 9
tput setaf 8; echo text ; tput setaf 9
tput setaf 9; echo text ; tput setaf 9
````
- Sometimes reset doesn't work. Use "7" in stead of "9" to reset.

Looks like
![text-color.png](pics/text-color.png?raw=true)
