# .bash_profile should be kept super simple and just load 
# .bashrc, .profile
echo ".bash_profile"

[[ -s ~/.bashrc ]] && source ~/.bashrc

if [ -f ~/.profile ]; then
    . ~/.profile
fi
