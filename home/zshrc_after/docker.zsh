eval $(docker-machine env dinghy)

# technekes/nib docker/compose wrapper
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
  # find exited containers that are not labeled "data" and remove them
  docker rm $(
    comm -13 \
      <(docker ps -aq -f status=exited -f label=data | sort) \
      <(docker ps -aq -f status=exited | sort)
  )
}

function dockercleanimages() {
  docker rmi $(docker images -f dangling=true -q)
}

function dockerclean() {
  dockercleancontainers && dockercleanimages
}

function docker() {
  case "$1" in
    clean*)
        case "$2" in
            images*)
                echo 'running docker clean images'
                dockercleanimages
                ;;
            containers*)
                echo 'running docker clean containers'
                dockercleancontainers
                ;;
            *)
                echo 'running docker clean all'
                dockerclean
                ;;
        esac
        ;;
    *)
        command docker "$@"
        ;;
  esac
}
