### grep for near words
# grepnear word1 word2 *
function grepnear() {
 grep -EHn "\b$1\W+(\w+\W+){1,20}$2\b" *
}

###
# show all system files; relaunch Finder
function showFiles() {
	defaults write com.apple.finder AppleShowAllFiles YES
	killall Finder /System/Library/CoreServices/Finder.app
}

# hide all system files; relaunch Finder
function hideFiles() {
	defaults write com.apple.finder AppleShowAllFiles NO
	killall Finder /System/Library/CoreServices/Finder.app
}

## Git functions
# source : http://tinyurl.com/8xe5ftp
# Shows branches with descriptions
function gb() {
  branches=$(git for-each-ref --format='%(refname)' refs/heads/ | sed 's|refs/heads/||')
  for branch in $branches; do
    desc=$(git config branch.$branch.description)
    if [ $branch == $(git rev-parse --abbrev-ref HEAD) ]; then
      branch="* \033[0;32m$branch\033[0m"
     else
       branch="  $branch"
     fi
     echo -e "$branch \033[0;36m$desc\033[0m"
  done
}

# formats PATH variable for easy viewing
# function showpat() {}  <- 'function' keyword is optional
showpath() {
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

