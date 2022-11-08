function t
  if count $argv > /dev/null
    set title $argv[1]
  else
    set title (basename $PWD)
  end

  kitty @ set-tab-title $title
  # kitty @ set-window-title " "
  # There can be a noticible delay running this command; sending it off
  # to the background
  # ACTUALLY: this doesn't appear to be working
  # kitty @ set-tab-title $title &; disown
end
