# .bashrc - only normally called in interactive mode

[[ -f ~/.bash_colors ]] && . ~/.bash_colors
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_functions ]] && . ~/.bash_functions


# osx specific editor
export EDITOR="/usr/local/bin/mate -w"  # see Textmate | Preferences | Terminal

export SHELL=$(which bash)

# enables shell command completion for gcloud.
if [ -f ~/Library/google-cloud-sdk/completion.bash.inc ]; then
  source ~/Library/google-cloud-sdk/completion.bash.inc
fi


# powerline-shell
function _update_ps1() {
    PS1="$(powerline-shell $?)"
}

# powerline-shell
if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi


# https://github.com/junegunn/fzf
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

# chruby
if [ -f /usr/local/share/chruby/chruby.sh ]; then
    . /usr/local/share/chruby/chruby.sh
    # default version
    chruby ruby-2.6.0
fi

[ -f /usr/local/share/chruby/auto.sh ] && . /usr/local/share/chruby/auto.sh

# rbenv
if command -v rbenv > /dev/null; then eval "eval "$(rbenv init -)""; fi

# pipenv
if command -v pipenv > /dev/null; then eval "$(pipenv --completion)"; fi

# mycd
# Directory based bash history profile
# overrides 'cd'; this might lead to some funky behaviour
# see: https://gist.github.com/leipzig/1651133
if [ -f $HOME/.mycd/mycd.sh ]; then . $HOME/.mycd/mycd.sh; fi

# ansible
if command -v python3 > /dev/null 2>&1; then export VIRTUALENV_PYTHON=$(which python3); fi

# virtualenvwrapper
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# added by travis gem
[[ -f ~/.travis/travis.sh ]] && source ~/.travis/travis.sh

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for any local configuration
[[ -f ~/.bashrc_local ]] && . ~/.bashrc_local

export PATH="~/.local/bin:$PATH"

