echo .bash_aliases

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
alias ..='cd ..'
