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

# source vim environment config
[ -f ~/.vim/.env ] && source ~/.vim/.env

# source fzf configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
