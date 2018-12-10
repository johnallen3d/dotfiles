alias nekes='cd ~/development/technekes'
# alias dfm-ssh='screen $(readlink $HOME/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty)'
alias irb='docker-ruby'
alias dr='docker-ruby'
alias pry='docker-ruby'

alias vi=nvim
alias vim=nvim
alias notes='t notes; vi -c "packadd vimwiki | normal '',ww''"'
alias ws='nvim -c DefaultWorkspace'
alias :e=vim
alias :q=exit

alias uuid="uuidgen | tr -d '\\n' | tr '[:upper:]' '[:lower:]' | pbcopy; pbpaste; echo"

alias yt="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"

alias ls='exa --header'
alias la='exa -hla --git'
alias tree='exa --tree'
alias ..='cd ..'

alias icat='kitty +kitten icat'

alias passgen='dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 | rev | cut -b 2- | rev'
alias password=passgen
alias pass=passgen

# home folder alias for git, see here for more details
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/local/bin/git --git-dir=/Users/johna/.cfg/ --work-tree=/Users/johna'
alias cfg=config
