#!/bin/bash
clear
cat << EOF
Please Select:
    1. MenuItem 1
    2. MenuItem 2
    3. MenuItem 3
    0. Exit
EOF
echo -n 'Enter selection (0-3): '
read -r answer

case $answer in
        0) echo "Bye..";;
        1) uptime;;
        2) echo "Hi!";;
        3) echo "Item 3";;
        *)
                echo "Invalid entry." >&2
                exit 1
esac
