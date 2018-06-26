alias nekes='cd ~/development/technekes'
alias dfm-ssh='screen $(readlink $HOME/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty)'
alias irb='docker-ruby'
alias dr='docker-ruby'
alias pry='docker-ruby'

alias vi=nvim
alias vim=nvim
alias scratch='vi ~/tmp/scratch.md'
alias notes='vi -c "packadd vimwiki | normal '',ww''"'
alias :e=vim
alias :q=exit

source $(dirname $(gem which colorls))/tab_complete.sh
alias ls='colorls'
# alias la='colorls -la'
alias la='colorls -lA --sd'

alias icat='kitty icat'

alias ws='nvim -c DefaultWorkspace'

alias passgen='dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 | rev | cut -b 2- | rev'

alias rc='brew services restart chunkwm'

# alias music='ncmpcpp --screen visualizer'
alias music='ncmpcpp'

# home folder alias for git, see here for more details
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/local/bin/git --git-dir=/Users/johna/.cfg/ --work-tree=/Users/johna'
