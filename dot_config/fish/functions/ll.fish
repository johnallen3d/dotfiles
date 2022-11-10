function ll
  if type -q lsd
    lsd -1a $argv
  else
    command ls -1a $argv
  end
end
