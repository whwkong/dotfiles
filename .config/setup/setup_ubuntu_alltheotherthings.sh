#!/usr/bin/env bash 

set -euxo pipefail

sudo apt update
sudo add-apt-repository ppa:nathan-renniewaldock/flux 
sudo apt install fluxgui -y

# i3 specifics
sudo apt install i3 rofi scrot

# msft todo
sudo snap install ao

