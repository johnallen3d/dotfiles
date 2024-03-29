#! /usr/bin/env fish

abbr --add dot chezmoi
# git/hub
# abbr --add gr 'git rebase -i @{u}'
abbr --add gst 'git status --short'
abbr --add gc 'git commit -v'
abbr --add gb 'git bv'
abbr --add gp 'git push'
abbr --add gpf 'git push --force-with-lease'
abbr --add gl 'git pull'
abbr --add gco 'git checkout'
abbr --add gm 'git merge --ff-only'
abbr --add gcf 'git commit --fixup'
abbr --add spp 'git stash && git pull && git stash pop'
abbr --add db delete-branch
# abbr --add pr 'hub pull-request --push --browse'
abbr --add bug git-bug

# abbr --add jq 'jq -C "."'
abbr --add jp 'jp "@"'

abbr --add events 'icalBuddy -f -n -ea -eep notes,attendees eventsToday'

abbr --add nekes 'cd ~/development/technekes'
abbr --add src 'cd ~/development/technekes/src'

# abbr --add irb 'docker-ruby'
# abbr --add dr 'docker-ruby'
# abbr --add pry 'docker-ruby'

abbr --add vi nvim
abbr --add vim nvim
abbr --add :e nvim

# muscle memory
abbr --add j z

# notes

# abbr --add notes 't notes && cd ~/Dropbox/Notes/vimwiki && nvim -c "packadd vimwiki | normal '',ww''"'
abbr --add notes 't notes && nvim -c "Neorg workspace programs"'
abbr --add journal 't journal && nvim -c "Neorg workspace journal" -c "Neorg journal today"'

# this is a function now 👇
# abbr --add diary 't diary && cd ~/Dropbox/Notes/vimwiki && nvim -c "packadd vimwiki | normal '',w,w''"'

abbr --add radar 't radar && cd ~/Dropbox/Notes/vimwiki && nvim radar.norg'
abbr --add ninja 't ninjas && cd ~/Dropbox/Notes/vimwiki && nvim Ops/2021\ Ninja\ Effort.norg'
abbr --add offer 't offer && cd ~/Dropbox/Notes/vimwiki && nvim Offer.md'
# abbr --add incent 't incent && cd ~/Dropbox/Notes/vimwiki && nvim Incent.norg'
abbr --add todo 't todo && cd ~/Dropbox/Notes/vimwiki && nvim TODO.norg'
abbr --add gtd 't gtd && cd ~/Dropbox/Notes/gtd && nvim inbox.norg'

abbr --add :q exit

abbr --add uuid "uuidgen | tr -d '\\n' | tr '[:upper:]' '[:lower:]' | pbcopy; pbpaste; echo"

abbr --add yt "youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"

# abbr --add tree 'exa --tree'
# abbr --add tree 'lsd --tree'
abbr --add tree erd

abbr --add .. 'cd ..'

# kitty / pi
abbr --add icat 'kitty +kitten icat'
abbr --add pi 'kitty +kitten ssh pi@pi.local'

abbr --add passgen 'dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 | rev | cut -b 2- | rev'
abbr --add password passgen
abbr --add pass passgen

# other
# abbr --add python '/usr/local/bin/python3'
# abbr --add pip '/usr/local/bin/pip3'
abbr --add weather 'curl wttr.in'
abbr --add files '/Users/johna/.cargo/bin/xplr'

abbr --add chat 'cd ~/dev/src/playground/gpt4all/chat && ./gpt4all-lora-quantized-OSX-m1'

# LINUX
# switch (uname)
# case Darwin
# case Linux
#   abbr --add pac 'sudo pacman --noconfirm -S'
#   # abbr --add docker 'sudo docker'

#   # macos brain
#   abbr --add pbcopy 'xclip -selection clipboard'
#   abbr --add pbpaste 'xclip -selection clipboard -o'
#   abbr --add open 'xdg-open'
# end
