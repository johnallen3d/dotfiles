# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# ZSH_THEME="robbyrussell-altered"
# ZSH_THEME="bira-altered"
# ZSH_THEME="das2"
# ZSH_THEME="candy"
# ZSH_THEME="cloud"

ZSH_THEME="mikeh-alt"

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

# Editor config
alias vi='/usr/bin/mvim -v -N'
alias vim=vi
export EDITOR=vim
set -o vi
set stty -ixon
alias tmux="TERM=screen-256color-bce tmux"

# Github/hub config
alias git=hub
if type compdef >/dev/null; then
   compdef hub=git
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
