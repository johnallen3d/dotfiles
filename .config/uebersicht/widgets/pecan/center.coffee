command: "date +\"%a, %b %d\""

refreshFrequency: '10m'

render: (output) ->
  """
    <div class='screen'>
      <div class='holder'>
        <div class='center'>
          <i class="fal fa-calendar-alt"></i>
          #{output}
        </div>
      </div>
    </div>
  """
