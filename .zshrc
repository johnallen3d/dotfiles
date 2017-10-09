#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# content above this line was sourced from prezto

# source all zsh config from ~/.zsh/after
for f in ~/.zsh/after/*.sh; do source $f; done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
