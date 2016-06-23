#
# technekes/nib docker/compose wrapper
#
alias nib='
  docker run \
    -it \
    --rm \
    -v $(pwd):$(pwd) \
    -v $HOME/.gem:/root/.gem \
    -v $HOME/.ssh:/root/.ssh \
    -v $HOME/.gitconfig:/root/.gitconfig \
    -w $(pwd) \
    -v $HOME/.docker/:/root/.docker/:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    technekes/nib'

alias nibdev='
  docker run \
    -it \
    --rm \
    -v $(pwd):$(pwd) \
    -w $(pwd) \
    -v $HOME/.docker:/root/.docker:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e "DOCKER_HOST_URL=$DOCKER_HOST" \
    nibdev:latest'

#
# msic apps as docker containers
#
function aws() {
  docker run \
    -it \
    --rm \
    --volume $HOME/.aws:/root/.aws \
    technekes/awscli "$@"
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
    codeclimate/codeclimate help
}

function jq() {
  docker run \
    -i \
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
