#
# msic apps as docker containers
#

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

function psql() {
  docker run \
    --rm \
    -it \
    governmentpaas/psql "$@"
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

brew-search() {
  term=$1

  echo "Searching homebrew..."
  brew search "$term"
  echo
  echo "Searching homebrew cask..."
  brew cask search "$term"
  echo
  echo "Searching mas..."
  mas search "$term"
}
