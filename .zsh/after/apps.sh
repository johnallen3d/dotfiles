#
# msic apps as docker containers
#
function aws() {
  docker run \
    -it \
    --rm \
    --volume $HOME/.aws:/root/.aws \
    --volume $PWD:/tmp \
    --workdir /tmp \
    technekes/awscli "$@"
}

function neovim() {
  # opens in neovim-dot-app
  open -a Neovim $*
}

function codeclimate() {
  docker run \
    --interactive \
    --tty \
    --rm \
    --env CODECLIMATE_CODE="$PWD" \
    --volume "$PWD":/code \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume /tmp/cc:/tmp/cc \
    codeclimate/codeclimate "${1:-help}"
}

function jq() {
  docker run \
    -i \
    -v $(pwd):$(pwd) \
    -w $(pwd) \
    --rm \
    colstrom/jq "$@"
}

# function heroku() {
#   docker run \
#     --rm \
#     -it \
#     -v $HOME/.netrc:/root/.netrc \
#     # -v $HOME/.heroku:/root/.heroku \
#     -v $PWD:/usr/src/app \
#     -w /usr/src/app \
#     technekes/heroku-toolbelt "$@"
# }

function http() {
  docker run \
    -t \
    --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --log-driver none \
    jess/httpie "$@"
}

function psql() {
  docker run \
    --rm \
    -it \
    governmentpaas/psql "$@"
}

function speedtest() {
  docker run \
    --rm \
    --net=host \
    tianon/speedtest
}

function yo() {
  docker run \
    --rm \
    -it \
    --volume "$PWD":"$PWD" \
    -w "$PWD" \
    yo \
    yo --no-insight "$@"
}
