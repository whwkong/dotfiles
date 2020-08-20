# Defined in - @ line 1
function ag --wraps='ag --skip-vcs-ignores' --description 'alias ag=ag --skip-vcs-ignores'
 command ag --skip-vcs-ignores $argv;
end
