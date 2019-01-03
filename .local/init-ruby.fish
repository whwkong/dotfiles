# chruby
if test -e /usr/local/share/chruby/chruby.fish
    source /usr/local/share/chruby/chruby.fish
    # only for auto-switching ruby versions when changing dirs
    # see: https://github.com/postmodern/chruby#auto-switching
    source /usr/local/share/chruby/auto.fish

    GREEN;
        echo "chruby initialized"
    NC;
end
