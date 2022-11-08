function ip
  switch (uname)
  case Darwin
    ifconfig | grep inet | grep broadcast | awk '{print $2}'
  case Linux
    ipconfig getifaddr en0 || \
      ipconfig getifaddr en1 || \
      ipconfig getifaddr en2 || \
      ipconfig getifaddr en3
  end
end
