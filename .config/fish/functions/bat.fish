function bat --wraps=batcat --description 'alias bat=batcat'
  if test (uname) = "Linux"
    batcat  $argv;
  end
end

