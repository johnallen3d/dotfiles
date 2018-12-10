#! /usr/bin/env bash

# added TITLEBAR for updating the tab and window titles with the pwd
case $TERM in
  xterm*)
  TITLEBAR="\[\033]0;\W\007\]"
  ;;
  *)
  TITLEBAR=""
  ;;
esac

RESET="\[\033[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[01;33m\]"

GIT_DIRTY="${RED}⊘${RESET}"
GIT_CLEAN="${GREEN}★${RESET}"

function prompt_command() {
  local status_color="$([ $? -eq 0 ] && echo -e "$GREEN" || echo -e "$RED")"

  local git_prompt=""

  if git rev-parse --git-dir > /dev/null 2>&1; then
    local git_branch="$(git symbolic-ref HEAD | sed 's!refs\/heads\/!!')"
    local git_unstaged_return_value="$(git diff-files --quiet; echo $?)"
    local git_status="$([ $git_unstaged_return_value -eq 0 ] && echo -e "$GIT_CLEAN" || echo -e "$GIT_DIRTY")"

    git_prompt="${RESET}  ${git_branch} ${git_status}"
  fi

  PS1="$TITLEBAR$BLUE\w${git_prompt}\n${status_color}=>${RESET} "
}

PROMPT_COMMAND=prompt_command

export PS1
