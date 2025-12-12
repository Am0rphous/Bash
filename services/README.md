# Services

- [Am0rphous cheatsheets -> services](https://github.com/Am0rphous/CheatSheets/tree/main/Linux%20%F0%9F%90%A7/Services)

1. Create a service, e.g. `touch /lib/systemd/system/EXAMPLE.service`
2. Add e.g.:
  ````shell
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
  ````shell
  sudo systemctl enable EXAMPLE.service
  sudo systemctl enable /untraditional/path/to/service/EXAMPLE.service
  sudo systemctl restart EXAMPLE
  sudo systemctl status EXAMPLE
  ````
- [Other service related commands](https://github.com/Am0rphous/CheatSheets/tree/main/Linux/Services)

