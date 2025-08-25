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


## ANSI Terminalfarger

Her er en oversikt over standard ANSI-farger for terminalen, med eksempler på hvordan du kan bruke dem i `zsh`/`bash`-script.

---

## Standard tekstfarger

| Farge       | ANSI-kode | Variabel i script       | Eksempelutskrift                     |
|-------------|-----------|-------------------------|--------------------------------------|
| Svart       | `30`      | `BLACK='\033[0;30m'`    | `echo -e "${BLACK}Svart${NC}"`        |
| Rød         | `31`      | `RED='\033[0;31m'`      | `echo -e "${RED}Rød${NC}"`            |
| Grønn       | `32`      | `GREEN='\033[0;32m'`    | `echo -e "${GREEN}Grønn${NC}"`        |
| Gul         | `33`      | `YELLOW='\033[0;33m'`   | `echo -e "${YELLOW}Gul${NC}"`         |
| Blå         | `34`      | `BLUE='\033[0;34m'`     | `echo -e "${BLUE}Blå${NC}"`           |
| Lilla       | `35`      | `MAGENTA='\033[0;35m'`  | `echo -e "${MAGENTA}Lilla${NC}"`      |
| Cyan        | `36`      | `CYAN='\033[0;36m'`     | `echo -e "${CYAN}Cyan${NC}"`          |
| Hvit        | `37`      | `WHITE='\033[0;37m'`    | `echo -e "${WHITE}Hvit${NC}"`         |

---

## Lyse tekstfarger

| Farge       | ANSI-kode | Variabel i script       | Eksempelutskrift                     |
|-------------|-----------|-------------------------|--------------------------------------|
| Lys svart   | `90`      | `LGRAY='\033[0;90m'`    | `echo -e "${LGRAY}Lys svart${NC}"`    |
| Lys rød     | `91`      | `LRED='\033[0;91m'`     | `echo -e "${LRED}Lys rød${NC}"`       |
| Lys grønn   | `92`      | `LGREEN='\033[0;92m'`   | `echo -e "${LGREEN}Lys grønn${NC}"`   |
| Lys gul     | `93`      | `LYELLOW='\033[0;93m'`  | `echo -e "${LYELLOW}Lys gul${NC}"`    |
| Lys blå     | `94`      | `LBLUE='\033[0;94m'`    | `echo -e "${LBLUE}Lys blå${NC}"`      |
| Lys lilla   | `95`      | `LMAGENTA='\033[0;95m'` | `echo -e "${LMAGENTA}Lys lilla${NC}"` |
| Lys cyan    | `96`      | `LCYAN='\033[0;96m'`    | `echo -e "${LCYAN}Lys cyan${NC}"`     |
| Lys hvit    | `97`      | `LWHITE='\033[0;97m'`   | `echo -e "${LWHITE}Lys hvit${NC}"`    |

---

## Bakgrunnsfarger

For bakgrunnsfarger, bytt ut `3` med `4` i ANSI-koden (f.eks. `41` for rød bakgrunn).
Eksempel:
```zsh
BG_RED='\033[0;41m'
echo -e "${BG_RED}Tekst med rød bakgrunn${NC}"
```

---

## Eksempel på bruk

```zsh
#!/bin/zsh
# Definer farger
CYAN='\033[0;36m'
LBLUE='\033[0;94m'
NC='\033[0m' # No Color

# Bruk farger
echo -e "${LBLUE}Domenenavn: github.com${NC}"
echo -e "${CYAN}Alder: 17 years 10 months 16 days${NC}"
```

---
### Merknader
- `NC='\033[0m'` **må** brukes for å nullstille fargen etter hver utskrift.
- Du kan kombinere farger, f.eks. lys blå tekst på hvit bakgrunn: `\033[0;94;47m`.
