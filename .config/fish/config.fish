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

    set -gx PATH "/usr/local/opt/ruby/bin" $PATH
    set -gx PATH "/usr/local/opt/openssl/bin" $PATH
    set -gx PATH ~/.gems/bin $PATH
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

    # requirements for ruby
    set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
    set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"
    set -gx PKG_CONFIG_PATH /usr/local/opt/openssl/lib/pkgconfig

    # Ruby exports
    set -gx GEM_HOME $HOME/.gems

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

    # chruby initialization moved to init-ruby.fish
    # use: source /.local/init-ruby.fish

     # Load and initialize Tacklebox configuration.  All tacklebox_* settings must
    # be set prior to this line.
    source ~/.tacklebox/tacklebox.fish
end

if status --is-interactive
    # Note that fish adds in paths from /etc/paths and /etc/paths.d, so this has
    # to be placed here.

    # pyenv; adds ~/.pyenv/shims to path, and sets pyenv auto-completions.
    # make sure to run this AFTER brew/ruby config (which prepends /usr/local/bin to path).
    # shims path must be before /usr/local/bin
    if type -q pyenv # check for pyenv
        source (pyenv init -|psub)
    end

    # pipsi must come after pyenv
    # added by pipsi (https://github.com/mitsuhiko/pipsi)
    set -x PATH /Users/thepathunfolds/.local/bin $PATH

    if status --is-login  # exclude for sub-shell
        # set python version to version pointed to by pyenv
        set -gx VIRTUALFISH_DEFAULT_PYTHON (which -p python)

        # activate plugins
        # http://virtualfish.readthedocs.io/en/latest/plugins.html#auto-activation
        eval (python -m virtualfish auto_activation projects)
    end
end

## If you need to auto-set envvars for specific venvs, use the virtualhooks tackle module.
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
