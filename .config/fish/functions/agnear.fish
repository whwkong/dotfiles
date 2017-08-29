function agnear --description "agnear '\bPATTERN1\W+(\w+\W+){1,n}PATTERN2'"
    if [ (count $argv) -eq 3 ]  # [] is shorthand for test command
        ag '\\b'$argv[1]'\\W+(\\w+\\W+){1,'$argv[3]'}'$argv[2]
    else
        ag '\\b'$argv[1]'\\W+(\\w+\\W+){1,10}'$argv[2]
    end
end
