function la
  if type -q lsd
    lsd -la
  else
    command ls -la
  end
end
