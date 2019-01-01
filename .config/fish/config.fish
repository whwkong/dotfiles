# for web-based fish config, use:
#     $ fish_config
# then visit http://localhost:8000/ to change configurations.
#
# fish will find scripts in ~/.config/fish/functions.

# path configuration
if status --is-login
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
    set -gx PATH $PATH /usr/local/lib/ruby/gems/2.6.0/bin

    # pyenv; adds ~/.pyenv/shims to path
    # Make sure shim paths are before usr/local/bin
    # use: 'which -a python' to debug.
    if type -q pyenv # check for pyenv
        # pyenv can interfere with pipenv in sub-shells
        # see: https://pipenv.readthedocs.io/en/latest/basics/#about-shell-configuration
        # see: https://www.bountysource.com/issues/41572382-wrong-python-inside-of-pipenv-shell
        # source (pyenv init -|psub)
    end

    set -gx PATH "/usr/local/opt/ruby/bin" $PATH
    set -gx PATH "/usr/local/opt/openssl/bin" $PATH
    set -gx PATH ~/.gems/bin $PATH

    # pipsi paths; this must come after pyenv
    set -gx PATH ~/.local/bin-2.7 $PATH
    set -gx PATH ~/.local/bin $PATH
end

# env var configuration
if status --is-login
    # for powerline
    set -gx TERM "xterm-256color"

    # for textmate
    set -gx EDITOR "/usr/local/bin/mate -w"

    # python
    set -gx PYTHONPATH ~/dev/python
    set -gx PYTHONDONTWRITEBYTECODE true # -x == export

    # pipenv
    # disable below to run pipenv shell in compatibility mode
    set -gx PIPENV_SHELL_FANCY 1 # 'pipenv shell' always runs in fancy mode

    # requirements for ruby
    set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
    set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"
    set -gx PKG_CONFIG_PATH /usr/local/opt/openssl/lib/pkgconfig

    # Ruby exports
    set -gx GEM_HOME $HOME/.gems


    # directory where all your virtualenvs are kept
    #   virtualenvwrapper's WORKON_HOME is for bash only
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


    # for cheat
    set -gx CHEATCOLORS true
    set -gx CHEATPATH "$HOME/.cheat/local"

    # Load local config
    if test -e ~/.config/fish/localfish/config_local.fish
        source ~/.config/fish/localfish/config_local.fish
    end
end


if status --is-interactive  # run in both login and interactive mode
    # rbenv
    if type -q rbenv
        status --is-interactive; and source (rbenv init -|psub)
    end

    # chruby
    if test -e /usr/local/share/chruby/chruby.fish
        source /usr/local/share/chruby/chruby.fish
        # only for auto-switching ruby versions when changing dirs
        # see: https://github.com/postmodern/chruby#auto-switching
        source /usr/local/share/chruby/auto.fish
    end


     # Load and initialize Tacklebox configuration.  All tacklebox_* settings must
    # be set prior to this line.
    source ~/.tacklebox/tacklebox.fish
end

if status --is-interactive
    # pyenv; adds ~/.pyenv/shims to path
    # make sure to run this AFTER brew/ruby config.  shims path must be before
    # usr/local/bin
    if type -q pyenv # check for pyenv
        source (pyenv init -|psub)
    end

    # set python version to version pointed to by pyenv
    # must be placed after pyenv
    set -gx VIRTUALFISH_DEFAULT_PYTHON (which python)

    # activate plugins
    # Must be placed after pyenv
    # http://virtualfish.readthedocs.io/en/latest/plugins.html#auto-activation
    eval (python -m virtualfish auto_activation projects)
end

## If you need to auto-set envvars for venvs, use the virtualhooks tackle module.
## Place all venv initialization in the
## $VIRTUAL_ENV/virtualhooks.fish file.
## see: https://github.com/justinmayer/tackle/tree/master/modules/virtualhooks#usage
#

# if using the [pipenv extension for fisherman](https://github.com/kennethreitz/fish-pipenv),
# then it launches `pipenv shell` whenever you enter a directory with a Pipfile.
# To automatically with `pipenv shell` you have to modify this file
#   .config/fish/conf.d/pipenv.fish
# see: https://github.com/kennethreitz/fish-pipenv/issues/18
#
