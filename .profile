# .bash_profile (but never called within OS X) 
#  -> sources .bashrc 
#    -> sources .profile

echo .profile

# Set pretty bash prompt
#export PS1=":) \W $ "
#set prompt
#e[<escape code>m   #denotes escape codes for color setting
export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]':)'\[\e[0m\]; else echo \[\e[31m\]O_o\[\e[0m\]; fi\` \u@\W \\$ " 

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