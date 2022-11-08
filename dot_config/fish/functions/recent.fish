function recent -d "Display the 25 most recent fils in the current directory"
  command exa --header -la --sort oldest | head -n 25
end
