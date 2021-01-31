function config --description 'alias config=/usr/bin/env git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
	/usr/bin/env git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv;
end
