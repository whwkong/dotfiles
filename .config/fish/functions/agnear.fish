function agnear --description "agnear 'PATTERN1.(1,count}PATTERN2'"
    # \b = word boundary
    if [ (count $argv) -eq 3 ]
        if [ $argv[3] -eq $argv[3] ]  # test whether argument is integer
            ag -i $argv[1]'.{1,'$argv[3]'}'$argv[2]
        end
    else if [ (count $argv) -eq 2 ]
        ag -i $argv[1]'.{1,10}'$argv[2]
    else
        echo 'searches for 2 patterns near each other.'
        echo 'usage: '
        echo 'agnear PATTERN1 PATTERN2 [count]'
        echo '  count defaults to 10'
    end
end
