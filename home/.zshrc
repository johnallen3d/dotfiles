# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# unsetopt correct_all

# setopt auto_cd
# cdpath=(/var/apps /var/gems)

export TERM="xterm-256color"

ARCH_FLAGS="-arch x86_64"

# Path config
# see /etc/paths and zshenv

if [[ -r $HOME/.custom_aliases ]]; then
  source $HOME/.custom_aliases
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

# added by travis gem
[ -f /Users/johna/.travis/travis.sh ] && source /Users/johna/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
