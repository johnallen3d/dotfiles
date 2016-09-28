#
# image and container cleanup helper
#
function dockercleancontainers() {
  if [[ -n "${1}" ]]; then
    docker rm $(docker ps -aq -f name="${1}")
  else
    # find exited containers that are not labeled "data" and remove them
    docker rm $(
      comm -13 \
        <(docker ps -aq -f status=exited --no-trunc -f label=data | sort) \
        <(docker ps -aq -f status=exited --no-trunc | sort)
    )
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
  dockercleancontainers && dockercleanimages
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

#
# a ruby environment for building gems and other one-off tasks
#
function docker-ruby() {
  local cmd="${1:-irb}"

  [[ $# -gt 0 ]] && shift

  docker run \
    -it \
    --rm \
    -v $PWD:/usr/src/app \
    -v $HOME/.gem:/root/.gem \
    -v $HOME/.ssh:/root/.ssh \
    -v $HOME/.gitconfig:/root/.gitconfig \
    -v $HOME/.netrc:/root/.netrc \
    -w /usr/src/app \
    ruby:latest /bin/bash -c "${cmd} $@"
}
