#!/bin/bash

#	Purge any docker packages from fedora install:
sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
#	Add repos and install basic utilities:
sudo dnf -y install dnf-plugins-core fastfetch git curl nano
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
#	Install the Docker packages:
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker