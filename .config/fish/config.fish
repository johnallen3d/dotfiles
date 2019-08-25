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

# https://www.reddit.com/r/vim/comments/ciuoxp/_/ev9pix5
set -x MANPAGER "nvim -c 'set ft=man' -"

switch (uname)
case Darwin
  # use ruby version installed by homebrew
  set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
case Linux
  # use ruby version installed by pacman
  # add home/bin to path
  # globally install node modules in $HOME directory
  set -g fish_user_paths \
    (ruby -e 'print Gem.user_dir')/bin \
    $HOME/bin \
    $HOME/.node_modules/bin \
    $fish_user_paths

  set -x NPM_CONFIG_PREFIX $HOME/.node_modules

  # load terminal theme from wpg
  # cat ~/.config/wpg/sequences
end


# THEME PURE #
set fish_function_path $HOME/.config/fish/functions/theme-pure/functions/ $fish_function_path
source $HOME/.config/fish/functions/theme-pure/conf.d/pure.fish
