# Various menu styles

#### Primitive
````
#!/bin/bash
# Bash Menu Script Example
PS3='Please enter your choice: '
options=("Option 1" "Option 2" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            echo "you chose choice 1"
            ;;
        "Option 2")
            echo "you chose choice 2"
            ;;
        "Option 3")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY"
           exit 1
           ;;
    esac
done
````

#### For later
````
# Create a variable to store the user's choice
CHOICE=""

# Create a loop to keep the menu open until the user exits
while [ "$CHOICE" != "EXIT" ]
do
    # Create a GUI menu using the dialog command
    CHOICE=$(dialog --title "Menu" --menu "Choose an option:" 15 60 4 \
    1 "Option 1" \
    2 "Option 2" \
    3 "Option 3" \
    EXIT "Exit" 3>&1 1>&2 2>&3)

    # Take action based on the user's choice
    case $CHOICE in
        1)
            echo "You chose Option 1"
            ;;
        2)
            echo "You chose Option 2"
            ;;
        3)
            echo "You chose Option 3"
            ;;
        EXIT)
            echo "Exiting..."
            ;;
    esac
done
````
