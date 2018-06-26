command: """
  ! lsof -i :5050 | \
    grep -q Dock && \
    /usr/local/bin/chunkwm --load-sa > /dev/null 2>&1
"""

refreshFrequency: '5s'

render: (output) -> ""
