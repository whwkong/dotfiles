#!/usr/bin/env bash
# Installing pyenv on ubuntu 20.4
sudo apt-get update
sudo apt-get install git python3-pip make build-essential libssl-dev zlib1g-dev libbz2-dev libffi-dev libreadline-dev libsqlite3-dev curl
sudo apt-get install --no-install-recommends make wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

sudo pip3 install virtualenvwrapper

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

