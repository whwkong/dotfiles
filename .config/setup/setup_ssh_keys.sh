#!/usr/bin/env bash

mkdir -p ~/.ssh/key_backup
cp ~/.ssh/id_rsa* ~/.ssh/key_backup

ssh-keygen -t rsa -C your_email@domain.com
