# config.config
# see : <https://hackercodex.com/guide/install-fish-shell-mac-ubuntu/#basic-configuration>
# type
#     $ fish_config
# then visit http://localhost:8000/ to change configurations.
#
# fish will find scripts in ~/.config/fish/functions.  None of the scripts
# require a shebang.
#
# If you place a fish-script in ~/dev/scripts or ~/.tacklebox/tacklebox.fish
# then you need add a shebang, chmod to executable.  Then the script runs within
# context of new shell (config.fish will be executed)
# Note that ~/.tacklebox/tacklebox.fish has no shebang and is called by another
# fish-script.

set -gx PATH ~/.config/fish . $PATH
set -gx PATH ~/dev/scripts/bash $PATH
set -gx PATH ~/dev/scripts/fish $PATH
set -gx PATH $PATH ~/Library/google-cloud-sdk/bin

if test -e ~/.config/fish/fish_colors.fish
    . ~/.config/fish/fish_colors.fish
end

GREEN; echo "loading config.fish..."; NC;

# for powerline
set -gx TERM "xterm-256color"

# for textmate
set -gx EDITOR "/usr/local/bin/mate -w"

# setting environment variables
# https://fishshell.com/docs/current/index.html#variables
set -gx PYTHONPATH ~/dev/python
set -gx PYTHONDONTWRITEBYTECODE true # -x == export

# pyenv
if command -v pyenv >/dev/null # check for pyenv
    status --is-interactive; and source (pyenv init -|psub)
end

# rbenv
if command -v rbenv >dev/null
    status --is-interactive; and source (rbenv init -|psub)
end

# set python version to version pointed to by pyenv
# unfortunately, not seem to be working wth vf
set -gx VIRTUALFISH_DEFAULT_PYTHON (which python)

# directory where all your virtualenvs are kept
#   virtualenvwrapper's WORKON_HOME is for bash only
set -gx VIRTUALFISH_HOME ~/.virtualenvs

# activate plugins
# http://virtualfish.readthedocs.io/en/latest/plugins.html#auto-activation
eval (python -m virtualfish auto_activation projects)

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
set -gx fish_user_paths "/usr/local/sbin" $fish_user_paths

# Load Tacklebox configuration
. ~/.tacklebox/tacklebox.fish

# Load local config
if test -e ~/.config/fish/localfish/config_local.fish
    . ~/.config/fish/localfish/config_local.fish
end

# for cheat
set -gx CHEATCOLORS true
set -gx CHEATPATH "$HOME/.cheat/local"

# for ruby 2.4.2
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

# virtualfish event handlers must be placed in init file; they cannot be auto-loaded
#   unlike virtualenvwrapper, vf emits fish events rather than using
#   preactivate/postdeactivate hooks of virtualenvwrapper.
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

