#!/usr/bin/env bash 

set -euxo pipefail

sudo apt update
sudo apt-add-repository ppa:fish-shell/release-3
sudo add-apt-repository ppa:nathan-renniewaldock/flux snapd
sudo apt install vim python3-pip silversearcher-ag grc fish curl httpie jq fluxgui -y

# i3 specifics
sudo apt install i3 rofi scrot

# python2 is not installed by default on 20.04

pip3 install powerline-shell
pip3 install --user virtualfish

