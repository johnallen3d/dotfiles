#! /usr/bin/env fish

# no need for a greeting
set fish_greeting

# source variables
source ~/.config/fish/variables.fish

# source git abbreviations
source ~/.config/fish/abbr.fish

# load autojump
if test -f /usr/local/share/autojump/autojump.fish
  source /usr/local/share/autojump/autojump.fish
end

# kitty completions
kitty + complete setup fish | source

# use ruby version installed by homebrew
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
# THEME PURE #
set fish_function_path /Users/johna/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /Users/johna/.config/fish/functions/theme-pure/conf.d/pure.fish
