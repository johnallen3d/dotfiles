#! /usr/bin/env fish

if not set -q abbrs_initialized
  # note: when adding an new abbreviation issue a `set -e abbrs_initialized`
  set -U abbrs_initialized

  # git/hub
  # abbr --add gr 'git rebase -i @{u}'
  abbr --add gst 'git status --short'
  abbr --add gc 'git commit -v'
  abbr --add gb 'git branch'
  abbr --add gp 'git push'
  abbr --add gpf 'git push --force-with-lease'
  abbr --add gl 'git pull'
  abbr --add gco 'git checkout'
  abbr --add gm 'git merge --ff-only'
  abbr --add gcf 'git commit --fixup'
  abbr --add spp 'git stash && git pull && git stash pop'
  abbr --add db 'delete-branch'
  abbr --add pr 'hub pull-request --push --browse'

  abbr --add jq 'jq -C "."'
  abbr --add jp 'jp "@"'

  abbr --add nekes 'cd ~/development/technekes'
  abbr --add src 'cd ~/development/technekes/src'

  abbr --add irb 'docker-ruby'
  abbr --add dr 'docker-ruby'
  abbr --add pry 'docker-ruby'

  abbr --add vi nvim
  abbr --add vim nvim
  abbr --add notes 't notes && vi -c "packadd vimwiki | normal '',ww''"'
  abbr --add ws 'nvim -c DefaultWorkspace'
  abbr --add :e vim
  abbr --add :q exit

  abbr --add uuid "uuidgen | tr -d '\\n' | tr '[:upper:]' '[:lower:]' | pbcopy; pbpaste; echo"

  abbr --add yt "youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"

  abbr --add ls 'exa --header'
  abbr --add la 'exa -hla --git'
  abbr --add tree 'exa --tree'
  abbr --add .. 'cd ..'

  abbr --add icat 'kitty +kitten icat'

  abbr --add passgen 'dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 | rev | cut -b 2- | rev'
  abbr --add password passgen
  abbr --add pass passgen

  abbr --add weather 'curl wttr.in'
end
