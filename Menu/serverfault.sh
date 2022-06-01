#!/bin/bash

cmd=(dialog --separate-output --checklist "Select options:" 22 76 16)
options=(1 "SSH" off    # any option can be set to default to "on"
         2 "Utfør fullstendig statussjekk på server" off
         3 "Mount delte mapper" off
         4 "Vis nettverksinfo" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

clear

for choice in $choices
do
    case $choice in
        1)
            echo "First Option"
            ;;
        2)
            echo "Second Option"
            ;;
        3)
            echo "Third Option"
            ;;
        4)
            echo "Fourth Option"
            ;;
    esac
done

