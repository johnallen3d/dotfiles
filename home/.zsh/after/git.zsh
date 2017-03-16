alias gr='git rebase -i @{u}'
alias gst='git status --short'
alias gc="git commit -v"
alias gb="git branch"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gl="git pull"
alias gco="git checkout"
alias gm='git merge --ff-only'

function delete-branch() {
  local branch="${1}"

  git push origin :$branch
  git branch -D $branch
}
