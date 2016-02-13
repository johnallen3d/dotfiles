function aws() {
  docker run \
    -it \
    --rm \
    --volume $HOME/.aws:/root/.aws \
    technekes/awscli "$@"
}

function codeclimate() {
  docker run \
    -it \
    --rm \
    --env CODE_PATH="$PWD" \
    --volume "$PWD":/code \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume /tmp/cc:/tmp/cc \
    codeclimate/codeclimate "$@"
}

function jq() {
  docker run \
    -i \
    --rm \
    --entrypoint=/bin/jq \
    realguess/jq "$@"
}
