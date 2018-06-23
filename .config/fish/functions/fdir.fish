function fdir --description 'runs find for file of type directory'
    if count $argv > /dev/null
        find $argv -type d
    else
        find . -type d
    end
end
