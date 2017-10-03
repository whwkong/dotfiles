# .bash_profile (but never called within OS X) 
#  -> sources .bashrc 
#    -> sources .profile

echo .profile

# Set environment variables
# export EDITOR=nano
export EDITOR="/usr/local/bin/mate -w" # see Textmate | Preferences | Terminal

export PATH=$PATH:~/dev/scripts/bash
export PATH=$PATH:/usr/local/mysql/bin
export PYTHONPATH=~/dev/python

# virtualenvwrapper 
export WORKON_HOME=~/.virtualenvs
# export PROJECT_HOME=~/dev/python
source /usr/local/bin/virtualenvwrapper.sh

export PYTHONDONTWRITEBYTECODE=true

export TERM="xterm-256color"