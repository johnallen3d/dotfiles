alias gr='git rebase -i @{u}'
alias gst='git status --short'
alias gc="git commit -v"
alias gb="git branch"
alias gp="git push"
alias gl="git pull"
alias gco="git checkout"
alias gm="git merge"

# alias git to hub if it's installed
hash hub 2>/dev/null && alias git=hub
