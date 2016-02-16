eval $(docker-machine env dinghy)

#
# technekes/nib docker/compose wrapper
#
alias nib='
  docker run                                             \
    -it                                                  \
    --rm                                                 \
    -w $(pwd)                                            \
    -v $(pwd):$(pwd)                                     \
    -v ~/.ssh/id_rsa:/root/.ssh/id_rsa:ro                \
    -v /var/run/docker.sock:/var/run/docker.sock         \
    technekes/nib'

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
        <(docker ps -aq -f status=exited -f label=data | sort) \
        <(docker ps -aq -f status=exited | sort)
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
