# contains everything NOT specifically related to bash, such as environment
# variables, PATH, etc
echo .profile

# note that ssh-agent is automatically running on OS X
ssh-add -K ~/.ssh/id_rsa     # add key
ssh-add -K ~/.ssh/id_rsa-old # ssh-add -K = Store passphrases in your keychain.

export TERM="xterm-256color"

# Set environment variables
# export EDITOR=vim
export EDITOR="/usr/local/bin/mate -w" # see Textmate | Preferences | Terminal

# path
export PATH=$PATH:~/dev/scripts/bash
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:~/Library/google-cloud-sdk/bin

# python specifics
export PYTHONPATH=~/dev/python
export PYTHONDONTWRITEBYTECODE=true

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/dev
printf "\nvirtualenvwrapper.sh not installed properly on new configuration :/ \n\n"
source /usr/local/bin/virtualenvwrapper.sh

# cheat
export CHEATCOLORS=true
export CHEATPATH="$HOME/.cheat/local"

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH=~/.local/bin:$PATH
