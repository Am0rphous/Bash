# Services

1. Create a service, e.g. `touch /lib/systemd/system/EXAMPLE.service`
2. Add e.g.:
````
[Unit]
Description=This is the description of the service :D

[Service]
Restart=always
RestartSec=7
User=root
WorkingDirectory=/my/path/where/stuff/is/stored/
ExecStart=/path/to/script/1.sh

[Install]
WantedBy=multi-user.target
````
3. Enable and reload services:
````
sudo systemctl enable EXAMPLE.service
sudo systemctl enable /untraditional/path/to/service/EXAMPLE.service
sudo systemctl restart EXAMPLE
sudo systemctl status EXAMPLE
````
#### Other service related commands
````
sudo systemctl mask EXAMPLE                       # more than disable. Prevents services and users to start, as the config is sent to /dev/null
sudo systemctl list-units --type=service --all    # list all services
sudo systemctl cat ssh                            # cat service info
sudo systemctl list-dependencies cron             # list dependencies
sudo systemctl list-dependencies cron --reverse   # list dependencies recursively
sudo systemctl edit ssh --full                    # edits the service
````

