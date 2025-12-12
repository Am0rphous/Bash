# Text

- Remove everyhting after '@' by running `echo "username@mail.com" | awk -F "@" '{print $1}'`
- Generate log in banner with [figlet](https://www.figlet.org/)
  ````shell
  sudo apt install figlet
  figlet WelcomeTextHere
  ````
