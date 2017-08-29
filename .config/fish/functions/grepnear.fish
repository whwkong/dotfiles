function grepnear
    grep -iEHn "\b$argv[1]\W+(\w+\W+){1,10}$argv[2]\b" *
end