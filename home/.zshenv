export EDITOR=mvim

# set history per session in iTerm
export HISTFILE=~/.zsh-history/${ITERM_SESSION_ID}

if [[ -r $HOME/.zshenv.after ]]; then
  source $HOME/.zshenv.after
fi
