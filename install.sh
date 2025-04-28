#!/bin/bash

# Sanity check:
echo "Would you like to install docker? (y/n)"
read dockerInstall

if [[ $dockerInstall == "y" || $dockerInstall == "Y" ]]; then
  echo "Which Linux distro are you currently running? (1-4):
  1 - Debian
  2 - Ubuntu
  3 - Fedora
  4 - Other"
  read linuxDistro
  echo "Very well."
  case $linuxDistro in
    1)
      # Debian:
      sudo ./debian.sh
      ;;
    2)
      # Ubuntu:
      sudo ./ubuntu.sh
      ;;
    3)
      # Fedora:
      sudo ./fedora.sh
      ;;
    4)
      # Other:
      echo "Other Linux distros are not supported at this time. 
      Please try this script again while using a supported platform."
      sleep 5
      clear
      exit 1
  esac
else
    echo "Very well - Return and run this script again when you are ready to begin the installation."
    sleep 5
    exit 1
fi
# Portainer install prompt:
clear
echo "Would you like to install portainer? (y/n)"
read portainerInstall
if [[ $portainerInstall == "y" || $portainerInstall == "Y" ]]; then
  echo "Which version of portainer would you like to install:
  1 - Portainer Business Edition
  2 - Portainer Community Edition
  3 - Portainer Agent"
  read portainerVersion
  echo "Very well."
  case $portainerVersion in
    1)
      # Install portainer ee docker container:
      sudo ./portainer-ee.sh
      ;;
    2)
      # Install portainer server docker container:
      sudo ./portainer-ce.sh
      ;;
    3)
      # Install portainer agent docker container:
      sudo ./portainer-agent.sh
      ;;
  esac
else
  # Future install instructions:
  echo "Very well, portainer will NOT be installed now."
  sleep 1
  echo "If you would like to install portainer in the future, return to this directory and run the script for the version you would like to install."
  sleep 2
fi
#	Clear before ending:
clear
echo "Installation complete."