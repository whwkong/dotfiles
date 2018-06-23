function lx --description 'lists all executable files'
    ls -F -G -l $argv | ag '^-..x'
end
