function ls
  if type -q lsd
    lsd -1
  else
    ls -1
  end
end
