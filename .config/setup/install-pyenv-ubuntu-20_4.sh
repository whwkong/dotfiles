#!/usr/bin/env bash
# Installing pyenv on ubuntu 20.4
# see: https://gist.github.com/jmvrbanac/8793985
sudo apt-get install git python3-pip make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl
sudo pip3 install virtualenvwrapper

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

