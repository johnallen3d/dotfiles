function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  set_color --bold blue
  echo -n (dirs)
  set_color normal

  git_prompt # <- external function
  echo

  if not test $last_status -eq 0
    set_color --bold red
  else
    set_color --bold green
  end

  echo -n '=> '
  set_color normal
end
