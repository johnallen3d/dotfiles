function la
  if type -q lsd
    lsd -la $argv
  else
    command ls -la $argv
  end
end
