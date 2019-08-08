function agnear --description "agnear '\bPATTERN1\W+(\w+\W+){1,count}PATTERN2'"
    if [ (count $argv) -eq 3 ]
        if [ $argv[3] -eq $argv[3] ]  # test whether argument is integer
            ag -i '\\b'$argv[1]'\\W+(\\w+\\W+){1,'$argv[3]'}'$argv[2]
        end
    else if [ (count $argv) -eq 2 ]
        ag -i '\\b'$argv[1]'\\W+(\\w+\\W+){1,10}'$argv[2]
    else
        echo 'usage: '
        echo 'agnear PATTERN1 PATTERN2 [count]'
    end
end
