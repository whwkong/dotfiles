# .bash_profile only called in login mode
# Order of execution is
# .bash_profile
# .profile
# .bashrc
# .bash_aliases
# .bash_functions
# .bashrc_local


# call sh login intialization first
[[ -s ~/.profile ]] && source ~/.profile

# add ssh keys.
# ssh-add -K = store passphrases in your keychain
[[ -f ~/.ssh/id_rsa ]] && ssh-add -K ~/.ssh/id_rsa > /dev/null 2>&1


# Set pretty bash prompt
#export PS1=":) \W $ "
#set prompt
#e[<escape code>m   #denotes escape codes for color setting
export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]':)'\[\e[0m\]; else echo \[\e[31m\]O_o\[\e[0m\]; fi\` \u@\W \\$ "

# path
export PATH=$PATH:~/dev/scripts/bash
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:~/Library/google-cloud-sdk/bin
export PATH=$HOME/gems/bin:$PATH

# python specifics
export PYTHONPATH=~/dev/python
export PYTHONDONTWRITEBYTECODE=true

# vscode
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# ruby
export PATH=$(brew --prefix)/opt/openssl/bin:$PATH
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include
export PKG_CONFIG_PATH=$(brew --prefix)/opt/openssl/lib/pkgconfig
export GEM_HOME=$HOME/gems

# nvm
export NVM_DIR="$HOME/.nvm"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
export VIRTUALENVWRAPPER_PYTHON=~/.pyenv/shims/python3

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH


# updates PATH for the Google Cloud SDK.
if [ -f ~/Library/google-cloud-sdk/path.bash.inc ]; then
  source ~/Library/google-cloud-sdk/path.bash.inc
fi


# pyenv
# adds shims to path; should be located near end of configuration
# see: https://github.com/pyenv/pyenv#advanced-configuration
# we need to place (pyenv init) here and not .bashrc, due to conflict with pipenv shell
# see: https://www.bountysource.com/issues/41572382-wrong-python-inside-of-pipenv-shell
if command -v pyenv 1> /dev/null 2>&1; then 
    eval "$(pyenv init -)"
fi

# pipsi; this must come after pyenv init
export PATH=~/.local/bin:$PATH
export PATH=~/.local/bin-2.7:$PATH


[[ -s ~/.bashrc ]] && source ~/.bashrc

