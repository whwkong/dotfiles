# .bashrc - everything within interactive command line, aliases, etc.
# Ideally should not output anything.


# On OS X, this file is invoked by ~.\bash_profile, otherwise it is not
# loaded.  The alternative solution is to rename this file to .profile
# see : http://hayne.net/MacDev/Notes/unixFAQ.html
# Note : “rc” part stands for “runcom”, which is expanded to “run commands”.

# Always loads .bash-aliases
# from http://ss64.com/bash/syntax-bashrc.html
#

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_colors ]] && . ~/.bash_colors

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/git:\1 /'
}


# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/Library/google-cloud-sdk/path.bash.inc ]; then
  source ~/Library/google-cloud-sdk/path.bash.inc
fi

# The next line enables shell command completion for gcloud.
if [ -f ~/Library/google-cloud-sdk/completion.bash.inc ]; then
  source ~/Library/google-cloud-sdk/completion.bash.inc
fi


# Set pretty bash prompt
#export PS1=":) \W $ "
#set prompt
#e[<escape code>m   #denotes escape codes for color setting
export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]':)'\[\e[0m\]; else echo \[\e[31m\]O_o\[\e[0m\]; fi\` \u@\W \\$ "

# alternate ...
# export PS1="\[$c197\]\$(git_branch)\[$c69\]\u@\h \[$c227\]\w \[$c0\]
# \$ "

# powerline-shell
function _update_ps1() {
    PS1="$(powerline-shell $?)"
}

# powerline-shell
if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

### grep for near words
# grepnear word1 word2 *
function grepnear() {
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

export VIRTUALENV_PYTHON=$(which python3)
# pyenv
eval "$(pyenv init -)"

# pipsi; this must come after pyenv
export PATH=~/.local/bin:$PATH
export PATH=~/.local/bin-2.7:$PATH

# aliases
alias ls="ls -G"
alias ll="ls -alF"
alias lsl="ls -l"
alias lsa="ls -lah"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

# ruby stuff
[ -f /usr/local/share/chruby/chruby.sh ] && . /usr/local/share/chruby/chruby.sh
[ -f /usr/local/share/chruby/auto.sh ] && . /usr/local/share/chruby/auto.sh

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
source /usr/local/bin/virtualenvwrapper.sh

# added by travis gem
[ -f /Users/williamkong/.travis/travis.sh ] && source /Users/williamkong/.travis/travis.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -f ~/.bashrc_local ]] && . ~/.bashrc_local
