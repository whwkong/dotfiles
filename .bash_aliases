echo .bash_aliases

# The command . ~/.bash_aliases will source (load) ~/.bash_aliases in the 
# context of the currently running shell.

alias lsl="ls -l"
alias lsa="ls -lah"

alias config=/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME

alias mkdir="mkdir -p -v"

# 'graph' alias also duplicated in .gitconfig
alias gitgraph="git log --graph --oneline --decorate --all"

# Opens file using TextMate 
alias tm='function _textmate(){ open -a textmate $1; }; _textmate'

alias master='git checkout master'
alias st='open -a "Sublime Text"'
alias server="python -m SimpleHTTPServer"

# in ~/.bashrc_local
# alias mysql=/usr/local/mysql/bin/mysql  
# alias mysqladmin=/usr/local/mysql/bin/mysqladmin