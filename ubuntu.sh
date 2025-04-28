#!/bin/bash

#	Purge any docker packages from ubuntu install:
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
#	Update and install nala:
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y nala
#	Add repos and install basic utilities:
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo nala update && sudo nala upgrade -y
sudo nala install -y fastfetch konsole sl curl wget
#	Add Docker's official GPG key:
sudo nala install -y curl ca-certificates
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
#	Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo nala update
#	Install the Docker packages:
sudo nala install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#	Docker-compose install prompt:
clear
echo "Would you like to install docker-compose? (y/n)"
read composeInstall
if [[ $composeInstall == "y" || $composeInstall == "Y" ]]; then
  echo "Very well."
  # Install docker-compose:
  sudo ./docker-compose.sh
else
  # Future install instructions:
  echo "Very well, docker-compose will NOT be installed now."
  echo "If you would like to install it in the future return to this directory and run './docker-compose.sh' to begin the installation."
  sleep 3
fi