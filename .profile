# Called by Bourne sh for login shell.
# contains everything NOT specifically related to bash, such as environment
# variables, PATH, etc


export TERM="xterm-256color"
export EDITOR=vim

# cheat
export CHEATCOLORS=true
export CHEATPATH="$HOME/.cheat/local"

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
