#! usr/local/bin/fish
# see : http://butterflyprogramming.neoname.eu/programming-with-fish-shell/
# 
# getopt() function, see :
# https://www.freebsd.org/cgi/man.cgi?query=getopt
#  
function help_exit
    echo "Usage:  [options] Arguments..."
    echo "Options:"
    echo "-a : option"
    echo "-d : option"
    echo "-c option-argument : Do something with option-argument"
end

function parse_example
	# Given these arguments : 
	#     -ac tmp.fs hello world
	# getopt should return :
	#     "-a" "-c" "tmp.fs" "--" "hello" "world"
    set args (getopt abc:d: $argv); or help_exit

	# 'fish -c' invokes a new interpreter to evaluate commands
	# creates a list of arguments
	set args (fish -c "for el in $args; echo \$el; end") 
	
	set i 1
	while true
	    switch $args[$i]
	        case "-a"
	            echo "argument a is specified"
	        case "-b"
	            echo "argument b is specified"
	        case "-c"
	            set i (math "$i + 1")
	            echo "value of argument c is" $args[$i]
	        case "--"
	            break
	    end
		set i (math "$i + 1")
	end
	
	set pargs
	if math "$i <" (count $args) > /dev/null
	    set pargs $args[(math "$i + 1")..-1]
	end

	echo "positional arguments:" $pargs
end

