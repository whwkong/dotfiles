# my fish config file
# see : <https://hackercodex.com/guide/install-fish-shell-mac-ubuntu/#basic-configuration>
# type
#     $ fish_config
# then visit http://localhost:8000/ to change configurations.

set PATH ~/.config/fish . $PATH
set PATH ~/dev/scripts/bash $PATH
set PATH ~/dev/scripts/fish $PATH
set PATH $PATH ~/Library/google-cloud-sdk/bin
set PATH $PATH /usr/local/mysql/bin   # move locally
set PATH $PATH ~/node_modules/.bin  # move locally

# for textmate
set -gx EDITOR "/usr/local/bin/mate -w"

# setting environment variables
# https://fishshell.com/docs/current/index.html#variables
set -gx PYTHONPATH ~/dev/python

set -gx PYTHONDONTWRITEBYTECODE true # -x == export

# directory where all your virtualenvs are kept
set -gx VIRTUALFISH_HOME ~/.virtualenvs

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

if test -e ~/.config/fish/localfish/config_local.fish
    . ~/.config/fish/localfish/config_local.fish # run local config
end

# for cheat
set -gx CHEATCOLORS true

# virtualfish hooks
# see: http://virtualfish.readthedocs.io/en/latest/extend.html?highlight=hooks
function __venv_activated --on-event virtualenv_did_activate
    set venv_activation_file ~/.config/fish/localfish/__(basename $VIRTUAL_ENV)_activate.fish
    if test -e $venv_activation_file  # test if file exists
        . $venv_activation_file
    end
end

function __venv_deactivated --on-event virtualenv_did_deactivate
    set venv_deactivation_file ~/.config/fish/localfish/__(basename $VIRTUAL_ENV)_deactivate.fish
    if test -e $venv_deactivation_file
        . $venv_deactivation_file
    end
end
