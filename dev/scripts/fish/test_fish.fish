#!/usr/local/bin/fish
set -gx abc 'abc set correctly'
breakpoint

GREEN; echo "test_fish ok"; NC;

if not status --is-interactive
    BLUE; echo 'not interactive shell'; NC;
end

if not status --is-login
    BLUE; echo 'not login shell'; NC;
end

