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

#
# a ruby environment for building gems and other one-off tasks
#
# volume mounts in order:
#
# * local folder into working directory
# * pry config
# * pry history
# * bash history
# * RubyGems credentials
# * SSH credentials (git push)
# * git configuration (sign commits)
# * Gemfury and Heroku credentials
#
function docker-ruby() {
  docker run \
    -it \
    --rm \
    -w /usr/src/app \
    -v $PWD:/usr/src/app \
    -v $HOME/.pryrc:/root/.pryrc \
    -v $HOME/.pry_history:/root/.pry_history \
    -v $HOME/.bash_history:/root/.bash_history \
    -v $HOME/.gem:/root/.gem \
    -v $HOME/.ssh:/root/.ssh \
    -v $HOME/.gitconfig:/root/.gitconfig \
    -v $HOME/.netrc:/root/.netrc \
    johnallen3d/ruby-dev:latest "${@}"
}

function alpine() {
  docker run \
    --rm \
    -it \
    -v $PWD:$PWD \
    -w $PWD \
    alpine:latest ash
}

function ctop() {
  docker run \
    --rm \
    -it \
    --name=ctop \
    -v /var/run/docker.sock:/var/run/docker.sock \
    quay.io/vektorlab/ctop:latest
}
