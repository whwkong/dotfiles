# my fish config file
# see : <https://hackercodex.com/guide/install-fish-shell-mac-ubuntu/#basic-configuration>
# type
#     $ fish_config
# then visit http://localhost:8000/ to change configurations.

set PATH ~/.config/fish . $PATH
set PATH ~/dev/scripts/bash $PATH
set PATH ~/dev/scripts/fish $PATH
set PATH $PATH /usr/local/mysql/bin
set PATH $PATH ~/Library/google-cloud-sdk/bin
set PATH $PATH ~/node_modules/.bin

# for textmate
set -gx EDITOR "/usr/local/bin/mate -w"

# setting environment variables
# https://fishshell.com/docs/current/index.html#variables
set -gx PYTHONPATH ~/dev/python

set -gx PYTHONDONTWRITEBYTECODE true # -x == export

# directory where all your virtualenvs are kept
set -gx VIRTUALFISH_HOME ~/.virtualenvs

# set env variables required to run docker on vm dev
eval (docker-machine env dev)

# Paths to your tackle
set -gx tacklebox_path ~/.tackle ~/.tacklebox

# Theme
#set tacklebox_theme entropy
set -gx tacklebox_theme entropy

# Which modules would you like to load? (modules can be found in ~/.tackle/modules/*)
# Custom modules may be added to ~/.tacklebox/modules/
# Example format: set tacklebox_modules virtualfish virtualhooks
set -gx tacklebox_modules virtualfish virtualhooks

# Which plugins would you like to enable? (plugins can be found in ~/.tackle/plugins/*)
# Custom plugins may be added to ~/.tacklebox/plugins/
# Example format: set tacklebox_plugins python extract
set -gx tacklebox_plugins extract grc pip python up

# for brew
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths


# Load Tacklebox configuration
. ~/.tacklebox/tacklebox.fish

ssh-add -K ~/.ssh/id_rsa   # add key
ssh-add -K ~/.ssh/id_rsa-2 # add key

# for cheat
set -gx CHEATCOLORS true

# virtualfish hook : http://virtualfish.readthedocs.io/en/latest/extend.html?highlight=hooks
function myfunc --on-event virtualenv_did_activate
    # echo "The virtualenv" (basename $VIRTUAL_ENV) "was activated"
end
