export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init - --no-rehash)"

# see here for explanation: http://goo.gl/N46hS
export RUBY_HEAP_MIN_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

alias vi="mvim -v"
alias vim="mvim -v"

# devbox helpers
# export MDB_CREATOR=mdb_creator
# export MDB_CREATOR_PASSWORD=oBqa9Xd8hBdzKXtxvyWvSKDpdnIPVqnZ
# export MDB_HOST=localhost
# export MDB_PORT=5432
export DEV_BOX=$HOME/development/technekes/dev_ops/vagrant/dev_box
