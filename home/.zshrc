# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mikeh"

# plugins=(git rbenv bundler brew gem git-flow-completion textmate vi-mode)
plugins=(git brew gem git-flow-completion vi-mode)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

setopt auto_cd
cdpath=($HOME/development/technekes/dev_ops/vagrant/dev_box/apps $HOME/development/technekes/dev_ops/vagrant/dev_box/gems)

export TERM="xterm-256color"

ARCH_FLAGS="-arch x86_64"

# Path config
# see /etc/paths and zshenv

if [[ -r $HOME/.rbenvrc ]]; then
  source $HOME/.rbenvrc
fi

if [[ -r $HOME/.app_vars ]]; then
  source $HOME/.app_vars
fi

if [[ -r $HOME/.custom_aliases ]]; then
  source $HOME/.custom_aliases
fi

if [[ -r $HOME/.custom_variables ]]; then
  source $HOME/.custom_variables
fi

if [[ -r $HOME/.custom_functions ]]; then
  source $HOME/.custom_functions
fi

alias apps="cd /var/apps"
alias gems="cd /var/gems"

set stty -ixon
alias tmux="TERM=screen-256color-bce tmux"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

