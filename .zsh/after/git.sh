alias gr='git rebase -i @{u}'
alias gst='git status --short'
alias gc="git commit -v"
alias gb="git branch"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gl="git pull"
alias gco="git checkout"
alias gm='git merge --ff-only'
alias gcf='git commit --fixup'
alias spp='git stash && git pull && git stash pop'

# too many times have i typed gs and stashed when i meant to type gst!!!
unalias gs &> /dev/null

function delete-branch() {
  local branch="${1}"

  git push origin :$branch
  git branch -D $branch
}
alias db=delete-branch

# fixup the last (non-fixup) commit. avoids "fixup! fixup! fixup! ..."
fixup() {
  git log --oneline --no-color --max-count 30 \
    | grep -v fixup! \
    | head -n 1 \
    | awk '{print $1}' \
    | xargs git commit --fixup
}

# hub
# fpath=(~/.zsh/completions $fpath)
# autoload -U compinit && compinit

# eval "$(hub alias -s)"

alias pr="hub pull-request --push --browse"
