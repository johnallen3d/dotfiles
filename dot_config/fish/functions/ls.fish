function ls
  if type -q lsd
    lsd -1
  else
    command ls -1
  end
end
