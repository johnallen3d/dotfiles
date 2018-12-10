function fish_right_prompt --description 'Command duration on right'
  if test $cmd_duration && test $cmd_duration -gt 0
    set secs (math "$cmd_duration / 1000")
    echo $secs
  end
end
