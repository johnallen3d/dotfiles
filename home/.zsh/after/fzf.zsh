# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/usr/local/Cellar/fzf/HEAD/bin" ]]; then
  export PATH="$PATH:/usr/local/Cellar/fzf/HEAD/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/usr/local/Cellar/fzf/HEAD/man" && -d "/usr/local/Cellar/fzf/HEAD/man" ]]; then
  export MANPATH="$MANPATH:/usr/local/Cellar/fzf/HEAD/man"
fi

# Auto-completion
# ---------------
[[ $- =~ i ]] && source "/usr/local/Cellar/fzf/HEAD/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/Cellar/fzf/HEAD/shell/key-bindings.zsh"

# Use ag instead of the default find command for listing candidates.
# - The first argument to the function is the base path to start traversal
# - Note that ag only lists files not directories
# - See the source code (completion.{bash,zsh}) for the details.
# ------------
_fzf_compgen_path() {
  ag -g "" "$1"
}
export FZF_DEFAULT_COMMAND='ag -g ""'
