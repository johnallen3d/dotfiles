#! /usr/bin/env bash

# load bash completion for git
[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && . /usr/local/etc/bash_completion.d/git-completion.bash

# load autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# load fzf
[ -f /usr/local/etc/profile.d/fzf.bash ] && . /usr/local/etc/profile.d/fzf.bash

# enter a few characters and press up/down
if [ -t 1 ]; then
  bind '"[A":history-search-backward'
  bind '"[B":history-search-forward'
fi
