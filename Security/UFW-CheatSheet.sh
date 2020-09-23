#Various ufw commads

ufw enable
ufw reset

sudo ufw status verbose

#SSH
ufw allow ssh
sudo ufw allow 22/tcp
sudo ufw allow 22/tcp comment 'Open port ssh tcp port 22'

sudo ufw limit ssh
sudo ufw limit 22/tcp

#Allow All Incoming HTTP and HTTPS
sudo ufw allow proto tcp from any to any port 80,443
#or:
sudo ufw allow https
sudo ufw allow 443

#Allow MySQL to Specific Network Interface
sudo ufw allow in on eth1 to any port 3306

#Block Connections to a Network Interface
sudo ufw deny in on eth0 from 15.15.15.51


#Block outgoing smtp:
sudo ufw deny out 25

#block an IP:
sudo ufw deny from 15.15.15.51
