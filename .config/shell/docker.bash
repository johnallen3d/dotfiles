#! /usr/bin/env bash

#
# image and container cleanup helper
#
function dockercleancontainers() {
  if [[ -n "${1}" ]]; then
    docker container rm -f $(docker container ls -aq -f name="${1}") &> /dev/null
  else
    # find exited containers that are not labeled "data" and remove them
    docker rm $(
      comm -13 \
        <(docker container ls -aq -f status=exited --no-trunc -f label=data | sort) \
        <(docker container ls -aq -f status=exited --no-trunc | sort)
    ) &> /dev/null
  fi
}

function dockercleanimages() {
  if [[ -n "${1}" ]]; then
    docker images | grep "${1}" | awk '{print $3}' | xargs docker rmi
  else
    docker rmi $(docker images -f dangling=true -q)
  fi
}

function dockerclean() {
  dockercleancontainers; dockercleanimages
}

function docker() {
  case "$1" in
    clean*)
      case "$2" in
        images*)
          dockercleanimages "${3}"
          ;;
        containers*)
          dockercleancontainers "${3}"
          ;;
        *)
          dockerclean
          ;;
      esac
      ;;
    *)
      command docker "$@"
      ;;
  esac
}
