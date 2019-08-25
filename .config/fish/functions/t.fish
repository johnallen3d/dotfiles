function t
  if count $argv > /dev/null
    set title $argv[1]
  else
    set title (basename $PWD)
  end

  # kitty @ set-window-title " "
  kitty @ set-tab-title $title
end
