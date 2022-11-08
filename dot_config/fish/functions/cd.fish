function cd -d 'Change directory and list contents'
  builtin cd $argv

  if test $status = 0
    command lsd -1a
  end
end
