#!/bin/bash

# bash-it is `alias h=history` somehow this is what's used in `ctr + r` history
# searches and re-defining `h` without removing the alias first causes
# `ctrl + r` to call my heroku function!?!
unalias h

h() {
  local command=""

  case "$1" in
    logs|run)
      command="$1"
      shift
      ;;
    *)
      h_usage
      return 0
  esac

  # start arg handling
  POSITIONAL=()

  local deploy_env="prod"

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -h|-help)
        eval "h_${command}_usage"
        return 0
        ;;
      -e|--environment)
        deploy_env="$2"
        shift # past argument
        shift # past value
        ;;
      *)    # unknown option
        POSITIONAL+=("$1") # save it in an array for later
        shift # past argument
        ;;
    esac
  done

  set -- "${POSITIONAL[@]}" # restore positional parameters
  # end arg handling

  local dir_name=""
  local client_name=""
  local the_rest=""
  local app_name=""

  dir_name=$(echo "${PWD##*/}" | tr _ -)
  client_name=$(echo "$dir_name" | awk -F - '{print $1}')
  the_rest=$(echo "$dir_name" | cut -d- -f2-)

  app_name="${client_name}-${deploy_env}-${the_rest}"

  echo "$command"
  eval "h_$command" "$@"
}

h_logs() {
  echo "Attaching to Heroku logs for ${app_name}:" "${@}"
  heroku logs --tail --app "$app_name" "$@"
}

h_run() {
  echo "Running" "${@}" "on ${app_name}"
  heroku run "$@" --app "$app_name"
}

h_usage() {
cat <<-EOF
Usage: h COMMAND [flags]

 logs  display recent log output
 run   run a one-off process inside a Heroku dyno
EOF
}

h_logs_usage() {
cat <<-EOF
Usage: hl [flags]

Flags:
  -e, --environment ENV   environment to connect to (default: prod)
  -d, --dyno DYNO         dyno to limit filter by
  -n, --num NUM           number of lines to display

Example:

    $ hl -e stage -n 200
EOF
}

h_run_usage() {
cat <<-EOF
Usage: hl [flags]

Flags:
  -e, --environment ENV   environment to connect to (default: prod)
  -s, --size SIZE         dyno size
  --type TYPE             process type

Example:

    $ hr bash -e stage
    Running bash on app.... up, run.1
    ~ $

    $ hr rails c -s standard-2x
    Running rails c .... up, run.1 (Standard-2X)
    irb(main):001:0>
EOF
}
