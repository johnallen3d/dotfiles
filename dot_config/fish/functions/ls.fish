function ls
  if type -q lsd
    lsd -1 $argv
  else
    command ls -1 $argv
  end
end
