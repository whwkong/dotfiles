# for web-based fish config, use:
#     $ fish_config
# then visit http://localhost:8000/ to change configurations.
#
# fish will find scripts in ~/.config/fish/functions.
#
# To run old versions of fish:
# $ brew list fish --versions
# $ brew switch fish x.y.z
# see: https://zoltanaltfatter.com/2017/09/07/Install-a-specific-version-of-formula-with-homebrew/

set -g is_osx
set -g is_linux

switch (uname):
case Darwin:
    set is_osx true
case Linux:
    set is_linux true
case '*'
end

if begin eval $is_linux; or status --is-login; end
    ### path configuration
    # For PATH debugging, fish also prepends PATH with the universal variable
    # fish_user_paths
    # see: https://fishshell.com/docs/current/tutorial.html#tut_path
    if test -e ~/.config/fish/fish_colors.fish
        source ~/.config/fish/fish_colors.fish
    end

    set -gx PATH . $PATH
    set -gx PATH ~/dev/scripts/bash $PATH
    set -gx PATH ~/dev/scripts/fish $PATH
    set -gx PATH $PATH ~/Library/google-cloud-sdk/bin
    set -gx PATH $PATH /usr/local/sbin

    set -gx PATH "/usr/local/opt/openssl/bin" $PATH

    ### env var configuration
    # for powerline
    set -gx TERM "xterm-256color"

    if eval $is_linux
        # set -gx LD_PRELOAD /usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0
        set -gx EDITOR "/usr/bin/vim"

        # for ANKI 2.0 - picking up GTK theme on gnone
        set -gx GTK2_RC_FILES $HOME/.gtkrc-2.0
    else if eval $is_osx
        # for textmate
        set -gx EDITOR "/usr/local/bin/mate -w"
    end

    # python
    set -gx PYTHONPATH ~/dev/python
    set -gx PYTHONDONTWRITEBYTECODE true # -x == export

    # directory where all your virtualenvs are kept
    #   virtualenvwrapper's WORKON_HOME is for bash only
    set -gx VIRTUALFISH_HOME ~/.virtualenvs

    # Paths to tackle
    set -gx tacklebox_path ~/.tackle ~/.tacklebox

    # Theme
    #set tacklebox_theme entropy
    set -gx tacklebox_theme entropy

    # Load tacklebox modules (modules can be found in ~/.tackle/modules/*)
    # Custom modules may be added to ~/.tacklebox/modules/
    # set -gx tacklebox_modules virtualfish virtualhooks
    set -gx tacklebox_modules virtualhooks

    # Which plugins would you like to enable? (plugins can be found in ~/.tackle/plugins/*)
    # Custom plugins may be added to ~/.tacklebox/plugins/
    # Example format: set tacklebox_plugins python extract
    set -gx tacklebox_plugins extract grc pip python up

    # for cheat
    set -gx CHEATCOLORS true
    set -gx CHEAT_USER_DIR "$HOME/.cheat"
    set -gx CHEAT_PATH "./.cheat:$HOME/.config/cheat:$HOME/.config/cheat/local:$HOME/.config/cheat/django"

    # Load local config
    if test -e ~/.config/fish/localfish/config_local.fish
        source ~/.config/fish/localfish/config_local.fish
    end
end

if begin eval $is_osx; or status --is-login; end
    # set ruby for compilers
    set -gx LDFLAGS "-L/usr/local/opt/ruby/lib"
    set -gx CPPFLAGS "-I/usr/local/opt/ruby/include"#
    # for pkg-config to find ruby
    set -gx PKG_CONFIG_PATH "/usr/local/opt/ruby/lib/pkgconfig"

    set -gx GUILE_LOAD_PATH "/usr/local/share/guile/site/3.0"
    set -gx GUILE_LOAD_COMPILED_PATH "/usr/local/lib/guile/3.0/site-ccache"
    set -gx  GUILE_SYSTEM_EXTENSIONS_PATH "/usr/local/lib/guile/3.0/extensions"
end

# Load and initialize Tacklebox configuration.  All tacklebox_* settings must
# be set prior to this line.
if test -e ~/.tacklebox/tacklebox.fish
    source ~/.tacklebox/tacklebox.fish
end

# used by ptipython config
set -gx XDG_CONFIG_HOME $HOME/.config

# Note that fish adds in paths from /etc/paths and /etc/paths.d, so this has

# to be placed here.

# pyenv; adds ~/.pyenv/shims to path, and sets pyenv auto-completions.
# make sure to run this AFTER any brew/ruby config (which prepends /usr/local/bin to path).
# shims path must be before /usr/local/bin
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH
set -gx PATH $PYENV_ROOT/shims $PATH

if type -q pyenv 1>/dev/null 2>&1   # check for pyenv
    # source (pyenv init -|psub)   # see: https://fishshell.com/docs/2.4/commands.html#psub
    # source (pyenv init - | source)
    pyenv init - | source
end

set -gx PYTHONBREAKPOINT ipdb.set_trace

# pipsi must come after pyenv
# added by pipsi (https://github.com/mitsuhiko/pipsi)
set -x PATH $HOME/.local/bin $PATH

# set python version to version pointed to by pyenv
set -gx VIRTUALFISH_DEFAULT_PYTHON (which -p python3)

# bootstrap fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# If you need to auto-set envvars for specific venvs, use the virtualhooks tackle module.
# Place all venv initialization in the
# $VIRTUAL_ENV/virtualhooks.fish file.
# see: https://github.com/justinmayer/tackle/tree/master/modules/virtualhooks#usage


# if using the [pipenv extension for fisherman](https://github.com/kennethreitz/fish-pipenv),
# then it launches `pipenv shell` whenever you enter a directory with a Pipfile.
# To automatically with `pipenv shell` you have to modify this file
#   .config/fish/conf.d/pipenv.fish
# see: https://github.com/kennethreitz/fish-pipenv/issues/18
#

# Tacklebox
# Which modules would you like to load? (modules can be found in ~/.tackle/modules/*)
# Custom modules may be added to ~/.tacklebox/modules/
# Example format: set tacklebox_modules virtualfish virtualhooks

# Which plugins would you like to enable? (plugins can be found in ~/.tackle/plugins/*)
# Custom plugins may be added to ~/.tacklebox/plugins/
# Example format: set tacklebox_plugins python extract


# Paths to your tackle
set tacklebox_path ~/.tackle ~/.tacklebox

# Theme
#set tacklebox_theme entropy

# Which modules would you like to load? (modules can be found in ~/.tackle/modules/*)
# Custom modules may be added to ~/.tacklebox/modules/
# Example format: set tacklebox_modules virtualfish virtualhooks

# Which plugins would you like to enable? (plugins can be found in ~/.tackle/plugins/*)
# Custom plugins may be added to ~/.tacklebox/plugins/
# Example format: set tacklebox_plugins python extract

# Load Tacklebox configuration
. ~/.tacklebox/tacklebox.fish

# asdf :D 
. ~/.asdf/asdf.fish

# For APA
set -g DOCKER_CONTEXT "default"

