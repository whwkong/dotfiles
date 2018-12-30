# -G = colorized output
alias ls="ls -G"
alias ll="ls -alF"
alias lsl="ls -l"
alias lsa="ls -lah"

# for dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

alias mkdir="mkdir -p -v"
alias py="python"
alias py2="python2"
alias py3="python3"

# Opens file using TextMate
alias tm='function _textmate(){ open -a textmate $1; }; _textmate'

alias st='open -a "Sublime Text"'
alias server="python -m SimpleHTTPServer"
alias ..='cd ..'
alias pwd='pwd -P'
