function cd -d 'Change directory and list contents'
  builtin cd $argv

  if test $status = 0
    ll
  end
end
