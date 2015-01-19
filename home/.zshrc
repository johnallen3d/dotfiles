# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [[ `uname` == 'Linux' ]]; then
  ZSH_THEME='cloud'
else # should be 'Darwin' for OS X
  ZSH_THEME="dracula"
fi

# plugins=(git rbenv bundler brew gem git-flow-completion textmate vi-mode)
plugins=(git brew gem docker)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

setopt auto_cd
cdpath=(/var/apps /var/gems)

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

if [[ -r $HOME/.custom_functions.after ]]; then
  source $HOME/.custom_functions.after
fi

if [[ -r $HOME/.zshrc.after ]]; then
  source $HOME/.zshrc.after
fi

# make history search work: https://bbs.archlinux.org/viewtopic.php?id=52173
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# source nvm
if [[ -r $HOME/.nvm/nvm.sh ]]; then
  . ~/.nvm/nvm.sh
fi

### Added by the Heroku Toolbelt
if [[ -r /usr/local/heroku ]]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

# added by travis gem
[ -f /Users/johna/.travis/travis.sh ] && source /Users/johna/.travis/travis.sh
