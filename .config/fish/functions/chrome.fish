function chrome --description 'alias chrome = open -a /Applications/Google\ Chrome.app/'
    # linux: google-chrome $argv[1]
	open -a /Applications/Google\ Chrome.app/ $argv[1]
end
