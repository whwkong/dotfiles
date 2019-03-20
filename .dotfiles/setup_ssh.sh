#!/bin/bash

set -euxo pipefail

mkdir -p ~/.ssh

if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen
  eval 'ssh-agent'

  case $(uname) in
  'Linux')
    ssh-add ~/.ssh/id_rsa
    ;;
  'Darwin')
    ssh-add -K ~/.ssh/id_rsa
    ;;
  esac
fi

