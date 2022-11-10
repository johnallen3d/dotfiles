function ll
  if type -q lsd
    lsd -1a
  else
    command ls -1a
  end
end
