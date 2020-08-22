#!/usr/bin/env bash 

set -euxo pipefail

sudo apt update
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt install vim python3-pip silversearcher-ag grc fish curl httpie jq snapd -y

# python2 is not installed by default on 20.04

pip3 install powerline-shell
pip3 install --user virtualfish

