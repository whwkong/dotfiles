echo .bash_aliases

alias lsl="ls -l"
alias lsa="ls -lah"

alias config=/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME

alias mkdir="mkdir -p -v"
alias py="python"
alias py2="python2"
alias py3="python3"

# Opens file using TextMate 
alias tm='function _textmate(){ open -a textmate $1; }; _textmate'

alias st='open -a "Sublime Text"'
alias server="python -m SimpleHTTPServer"
alias ..='cd ..'
alias py='python'
alias pwd='pwd -P'