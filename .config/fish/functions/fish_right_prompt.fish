function fish_right_prompt --description 'Command duration on right'
  if test $CMD_DURATION && test $CMD_DURATION -gt 0
    set secs (math "$CMD_DURATION / 1000")
    echo $secs
  end
end
