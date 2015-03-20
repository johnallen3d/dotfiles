# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export EDITOR=mvim

# set history per session in iTerm
export HISTFILE=~/.zsh-history/${ITERM_SESSION_ID}

if [[ -r $HOME/.zshenv.after ]]; then
  source $HOME/.zshenv.after
fi
