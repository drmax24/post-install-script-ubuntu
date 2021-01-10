
#!/bin/bash
apt-get update -q
apt-get -y dist-upgrade

echo "Port 35242" >> /etc/ssh/sshd_config
service ssh restart

sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-get update
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo apt-get install vim -y
sudo apt-get install git -y
mkdir -p /opt/volumes/s1.drmax24.com/mysql
mkdir -p /opt/volumes/s1.drmax24.com/storage
mkdir -p /opt/volumes/traefik
sudo apt-get remove perl -y
sudo apt-get autoremove --purge
