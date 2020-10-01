function fd --wraps=fdfind --description 'alias fd=fdfind'
  if test (uname) = "Linux"
    fdfind  $argv;
  end
end
