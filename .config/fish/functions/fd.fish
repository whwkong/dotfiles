function fd --wraps=fdfind --description 'alias fd=fdfind'
  if test (uname) = "Linux"
    fdfind  $argv;
  else
    /usr/local/bin/fd $argv;
  end
end

