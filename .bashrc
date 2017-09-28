# On OS X, this file is invoked by ~.\bash_profile, otherwise it is not 
# loaded.  The alternative solution is to rename this file to .profile
# see : http://hayne.net/MacDev/Notes/unixFAQ.html
# 
# Note : “rc” part stands for “runcom”, which is expanded to “run commands”.

# Always loads .bash_aliases
# from http://ss64.com/bash/syntax-bashrc.html
#
echo .bashrc

if [ -f ~/.profile ]; then
	. ~/.profile
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

[[ -f ~/.bash_colors ]] && . ~/.bash_colors

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/git:\1 /'
}

# Set pretty bash prompt
#export PS1=":) \W $ "
#set prompt
#e[<escape code>m   #denotes escape codes for color setting
export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]':)'\[\e[0m\]; else echo \[\e[31m\]O_o\[\e[0m\]; fi\` \u@\W \\$ " 

# alternate ... 
# export PS1="\[$c197\]\$(git_branch)\[$c69\]\u@\h \[$c227\]\w \[$c0\]
# \$ "

# note that ssh-agent is automatically running on OS X
ssh-add -K ~/.ssh/id_rsa     # add key 
ssh-add -K ~/.ssh/id_rsa-old # ssh-add -K = Store passphrases in your keychain.


# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/williamkong/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/williamkong/Library/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/williamkong/Downloads/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/williamkong/Library/google-cloud-sdk/completion.bash.inc'
fi

### grep for near words 
function grepNear() {
 grep -EHn "\b$1\W+(\w+\W+){1,20}$2\b" *
}

### Function Definitions 
# show all system files; relaunch Finder
function showFiles() {
	defaults write com.apple.finder AppleShowAllFiles YES
	killall Finder /System/Library/CoreServices/Finder.app
}

# hide all system files; relaunch Finder
function hideFiles() {
	defaults write com.apple.finder AppleShowAllFiles NO
	killall Finder /System/Library/CoreServices/Finder.app
}

## Git functions
# source : http://tinyurl.com/8xe5ftp
# Shows branches with descriptions
function gb() {
  branches=$(git for-each-ref --format='%(refname)' refs/heads/ | sed 's|refs/heads/||')
  for branch in $branches; do
    desc=$(git config branch.$branch.description)
    if [ $branch == $(git rev-parse --abbrev-ref HEAD) ]; then
      branch="* \033[0;32m$branch\033[0m"
     else
       branch="  $branch"
     fi
     echo -e "$branch \033[0;36m$desc\033[0m"
  done
}

# formats PATH variable for easy viewing
# function showpat() {}  <- 'function' keyword is optional 
showpath() {
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

source /usr/local/etc/bash_completion.d/password-store

