export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init - --no-rehash)"

# see here for explanation: http://goo.gl/N46hS
export RUBY_HEAP_MIN_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

# Editor config
if [[ -r /usr/bin/mvim ]]; then
  alias vi='/usr/bin/mvim -v -N'
  alias vim=vi
fi

export EDITOR=vi
set -o vi

# devbox helpers
export DEV_BOX=$HOME/development/technekes/dev_ops/vagrant/dev_box
