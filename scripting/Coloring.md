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
- 
 ![text-color.png](pics/text-color.png?raw=true)


#### ANSI

````shell
Farge,Kode,Variabel i script,Eksempelutskrift
Svart,30,BLACK='\033[0;30m',echo -e "${BLACK}Svart${NC}"
Rød,31,RED='\033[0;31m',echo -e "${RED}Rød${NC}"
Grønn,32,GREEN='\033[0;32m',echo -e "${GREEN}Grønn${NC}"
Gul,33,YELLOW='\033[0;33m',echo -e "${YELLOW}Gul${NC}"
Blå,34,BLUE='\033[0;34m',echo -e "${BLUE}Blå${NC}"
Lilla,35,MAGENTA='\033[0;35m',echo -e "${MAGENTA}Lilla${NC}"
Cyan,36,CYAN='\033[0;36m',echo -e "${CYAN}Cyan${NC}"
Hvit,37,WHITE='\033[0;37m',echo -e "${WHITE}Hvit${NC}"
````
