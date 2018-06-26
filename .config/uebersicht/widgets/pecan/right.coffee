command: "date '+%H:%M'"

refreshFrequency: '2s'

render: (output) ->
  """
    <div class='screen'>
      <div class='right'>
        <i class="fal fa-clock"></i>
        <span id="current_time">#{output}</div>
      </div>
    </div>
  """

update: (output, domEl) ->
  container = domEl.querySelector('#current_time');

  return if container.innerHTML == output;

  container.innerHTML = output;
