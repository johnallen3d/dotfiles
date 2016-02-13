# quick editor
alias scratch='vi ~/temp/scratch.md'

# vim brain
alias :e=vim
alias :q=exit

if hash mvim 2>/dev/null; then
  # always use mvim
  alias vi="/usr/local/bin/mvim -v"
  alias vim="/usr/local/bin/mvim -v"
fi
