#! /usr/bin/env bash

# source all shell config from ~/.config/shell/*.sh
for f in ~/.config/shell/*.sh; do source "$f"; done

# source all bash config from ~/.config/shell/*.bash
for f in ~/.config/shell/*.bash; do source "$f"; done

# source vim environment config
[ -f ~/.vim/.env ] && source ~/.vim/.env
