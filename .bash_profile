echo ".bash_profile"

# ~/.bash_profile is only sourced by bash when started in interactive login mode.  
# 
# However, in OS X, Terminal runs a non-login shell (no user name and passwd is req'd), 
# which invokes ~./bashrc
# This means ~./bashrc is sourced, but ~./bash_profile is not. 
# 


# However, on systems where Terminals open a login shell, ~/.bash_profile will get 
# executed but ~/.bashrc will not. Thus, the following snippet will load 
# ~/.bashrc 
[[ -s ~/.bashrc ]] && source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/Library/google-cloud-sdk/path.bash.inc ]; then
  source '~/Library/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f ~/Library/google-cloud-sdk/completion.bash.inc ]; then
  source '~/Library/google-cloud-sdk/completion.bash.inc'
fi
