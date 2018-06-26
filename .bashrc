#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="/Users/johna/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='purity'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# This will disable showing untracked, unstaged and staged file counts in the prompt
export SCM_GIT_SHOW_DETAILS=false
# Don't show info on untracked files
export SCM_GIT_IGNORE_UNTRACKED=true
# Speed up the prompt while still getting minimal git status information
export SCM_GIT_SHOW_MINIMAL_INFO=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT/bash_it.sh"

# source all zsh config from ~/.zsh/after
for f in ~/.config/shell/*.sh; do source "$f"; done

# source vim environment config
[ -f ~/.vim/.env ] && source ~/.vim/.env
