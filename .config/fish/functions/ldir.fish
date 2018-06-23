function ldir --description 'lists all directories'
    ls -F -G -l $argv | grep '/$'
end
